import { mysqlQuery } from '../connect-sql.js';
import ms from 'ms';

export default class Score {
    static getAll = (req, res) => {
        mysqlQuery('SELECT * FROM member')
            .then((rows) => {
                res.end(JSON.stringify(rows));
            })
            .catch((err) =>
                setImmediate(() => {
                    throw err;
                }),
            );
    };

    static createScore = (req, res) => {
        mysqlQuery('INSERT INTO game_score SET ?', req.body)
            .then((rows) => {
                let data = [req.body.score, req.body.member_id];

                mysqlQuery('UPDATE member SET star = star + ? WHERE id = ?', data).then((rows) => {
                    res.send({ msg: 'success' });
                });
            })
            .catch((err) => {
                return res.status(403).send({ error: err });
            });
    };

    static getByMemberId = (req, res) => {
        mysqlQuery('SELECT *,MAX(score) as max_score FROM game_score WHERE member_id = ? GROUP BY game', req.params.id)
            .then(function (rows) {
                return res.send({
                    gameScore1: rows[1].max_score,
                    gameScore2: rows[0].max_score,
                    gameScore3: rows[2].max_score,
                    gameScore4: rows[3].max_score,
                });
            })
            .catch((err) => {
                return res.status(403).send({ error: err });
            });
    };

    static getStageByMemberId = (req, res) => {
        mysqlQuery(
            'SELECT * FROM (SELECT id,score,game FROM game_score WHERE member_id = ? AND game = ? ORDER BY created_at DESC LIMIT 10) as g ORDER BY g.id ASC',
            [req.params.id, req.params.game],
        )
            .then(function (rows) {
                console.log(rows);
                return res.send({ score: rows });
            })
            .catch((err) => {
                return res.status(403).send({ error: err });
            });
    };

    static remove = (req, res) => {
        mysqlQuery('DELETE FROM member WHERE id = ?', req.params.id)
            .then(function (result) {
                res.end(JSON.stringify(result));
            })
            .catch((err) =>
                setImmediate(() => {
                    throw err;
                }),
            );
    };
}

// export default { getAll, getById, register, login, edit, remove };
