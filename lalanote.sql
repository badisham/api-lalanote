-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 11, 2021 at 01:48 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lalanote`
--

-- --------------------------------------------------------

--
-- Table structure for table `game_score`
--

CREATE TABLE `game_score` (
  `id` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `game` varchar(255) NOT NULL,
  `member_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `game_score`
--

INSERT INTO `game_score` (`id`, `score`, `game`, `member_id`, `created_at`) VALUES
(5, 3, 'note', 12, '2021-02-10 16:12:30'),
(6, 0, 'ball', 12, '2021-02-10 16:11:10'),
(7, 5, 'rhythm', 12, '2021-02-10 16:12:33'),
(8, 10, 'sound', 12, '2021-02-10 16:12:36'),
(9, 50, 'ball', 12, '2021-02-10 16:11:10'),
(10, 180, 'note', 12, '2021-02-10 16:12:30'),
(11, 205, 'sound', 12, '2021-02-10 16:12:36'),
(12, 60, 'ball', 12, '2021-02-10 16:43:09'),
(13, 135, 'rhythm', 12, '2021-02-10 16:44:11');

-- --------------------------------------------------------

--
-- Table structure for table `institution`
--

CREATE TABLE `institution` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `institution`
--

INSERT INTO `institution` (`id`, `name`, `created_at`) VALUES
(14, 'Peace Music Academy', '2021-02-11 08:47:58'),
(15, 'Kidsmusic', '2021-02-11 08:51:10');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `star` int(11) NOT NULL DEFAULT 0,
  `type` varchar(255) NOT NULL,
  `institution` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`id`, `username`, `password`, `email`, `star`, `type`, `institution`, `created_at`) VALUES
(12, 'zxc', 'zxc', 'zxc', 0, 'customer', '', '2021-02-10 16:11:00');

-- --------------------------------------------------------

--
-- Table structure for table `member_reward`
--

CREATE TABLE `member_reward` (
  `id` int(11) NOT NULL,
  `reward_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `get_already` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ms_ads`
--

CREATE TABLE `ms_ads` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `img` text NOT NULL,
  `url` text NOT NULL,
  `institution_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ms_ads`
--

INSERT INTO `ms_ads` (`id`, `name`, `description`, `img`, `url`, `institution_id`, `created_at`) VALUES
(3, 'Peace Music Academy', 'โรงเรียนสอนดนตรีที่มีสูตรการเรียนการสอนที่คำนึงถึงความสุขของผู้เรียนเป็นอย่างแรก เน้นผู้เรียนและครอบครัวเป็นศูนย์กลางการเรียนรู้ มุ่งเน้นสร้างกิจกรรมระหว่างผู้ปกครองกับบุตรหลานในเวลาหลังเลิกเรียน มีการเรียนภาษาอังกฤษจากผู้สอนทีเป็นเจ้าของภาษาในชั้นเรียนดนตรีอีกด้วยเพื่อเป็นการสร้างความคุ้นเคยกับภาษาในกิจกรรมสันทนาการภายใต้ใบอนุญาตจากกระทรวงศึกษาธิการ ผู้ที่สนใจสามารถเรียนฟรีได้ 15 นาทีเพื่อเป็นการดูการเรียนการสอนของโรงเรียนสอนดนตรีและวางแผนการเรียนการสอน โปรโมชั่นตอนนี้คือจะมีส่วนลดหากมีเพื่อนเรียนอยู่แล้วในโรงเรียนหรือชวนเพื่อนมาเรียนด้วยค่ะ\r\n', 'https://lalanote.s3.amazonaws.com/451dbb09-ae0d-46f6-8cd1-b0b54088e9af.jpg', 'www.peacemusicacademy.com', 14, '2021-02-11 08:50:48'),
(4, 'Kidsmusic', 'โรงเรียนสอนดนตรีและพัฒนาการสำหรับเด็กเล็ก โดยมีหลักสูตรและการสอนที่ด้ผ่านการวิจัยและพัฒนาขึ้นมาสำหรับเด็กเล็กโดยเฉพาะ (Research-based music program) เพื่อให้พ่อแม่ผู้ปกครองมั่นใจได้ว่าสามารถเสริมสร้างพัฒนาการให้แก่บุตรหลานที่มีอายุแรกเกิดถึง 6 ปีได้อย่างมีประสิทธิภาพ ทางโรงเรียนมุ่งเน้นสร้างเสริมการเรียนรู้ให้เด็กๆ ผ่านเสียงเพลง เครื่องดนตรีและกิจกรรมเข้าจังหวะด้วยหลักสูตรของสถาบัน Kindermusik  ภายใต้งานวิจัยว่าหลักสูตรนี้จะสามารถเพื่อพัฒนาการด้านการด้านภาษาและการเขียน มากกว่าเด็กที่ไม่ได้เข้าเรียนกว่า 32% เลยทีเดียว', 'https://lalanote.s3.ap-southeast-1.amazonaws.com/9cd43954-45e2-4871-b719-53fc53952cd9.jpg', 'www.kidsmusic.co.th', 15, '2021-02-11 08:51:40');

-- --------------------------------------------------------

--
-- Table structure for table `ms_reward`
--

CREATE TABLE `ms_reward` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `img` text NOT NULL,
  `institution_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `use_star_point` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ms_reward`
--

INSERT INTO `ms_reward` (`id`, `name`, `description`, `img`, `institution_id`, `created_at`, `use_star_point`) VALUES
(19, 'เรียนฟรี 4 ชม', 'ฟหกฟฟไกฟไกฟไกฟไกไก', 'https://lalanote.s3.ap-southeast-1.amazonaws.com/e806924f-85a3-4e25-9f52-b6246b2e91cb.jpg', 14, '2021-02-11 08:56:16', 30),
(20, 'เรียนกีต้าฟรี', 'ฟไกฟไกฟไกไฟก', 'https://lalanote.s3.ap-southeast-1.amazonaws.com/1f0fd8e1-88a9-4365-9dd1-07e361016bb9.jpg', 15, '2021-02-11 08:57:06', 40);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `game_score`
--
ALTER TABLE `game_score`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `institution`
--
ALTER TABLE `institution`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `member_reward`
--
ALTER TABLE `member_reward`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ms_ads`
--
ALTER TABLE `ms_ads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ms_reward`
--
ALTER TABLE `ms_reward`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `game_score`
--
ALTER TABLE `game_score`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `institution`
--
ALTER TABLE `institution`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `member_reward`
--
ALTER TABLE `member_reward`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ms_ads`
--
ALTER TABLE `ms_ads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ms_reward`
--
ALTER TABLE `ms_reward`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
