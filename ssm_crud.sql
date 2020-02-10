-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2020-02-10 06:25:23
-- 服务器版本： 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ssm_crud`
--

-- --------------------------------------------------------

--
-- 表的结构 `tbl_dept`
--

CREATE TABLE `tbl_dept` (
  `dept_id` int(11) NOT NULL,
  `dept_name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tbl_dept`
--

INSERT INTO `tbl_dept` (`dept_id`, `dept_name`) VALUES
(2, 'Testing Department'),
(1, 'Development Department');

-- --------------------------------------------------------

--
-- 表的结构 `tbl_emp`
--

CREATE TABLE `tbl_emp` (
  `emp_id` int(11) NOT NULL,
  `emp_name` varchar(255) NOT NULL,
  `gender` char(1) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `d_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tbl_emp`
--

INSERT INTO `tbl_emp` (`emp_id`, `emp_name`, `gender`, `email`, `d_id`) VALUES
(1, 'Bruce', 'M', 'yesnhsly@outlook.com', 1),
(3, 'b89fd1', 'M', 'b89fd1@qq.com', 1),
(6, '495324', 'M', '495324@qq.com', 1),
(7, 'b3a785', 'M', 'b3a785@qq.com', 1),
(8, '476b96', 'M', '476b96@qq.com', 1),
(9, 'c60bf7', 'M', 'c60bf7@qq.com', 1),
(10, 'f063f8', 'M', 'f063f8@qq.com', 1),
(11, 'f5fdb9', 'M', 'f5fdb9@qq.com', 1),
(12, 'bb93e10', 'M', 'bb93e10@qq.com', 1),
(13, '4f48811', 'M', '4f48811@qq.com', 1),
(14, '28f4212', 'M', '28f4212@qq.com', 1),
(15, '7df0e13', 'M', '7df0e13@qq.com', 1),
(16, '7ef5a14', 'M', '7ef5a14@qq.com', 1),
(18, '3f20616', 'M', '3f20616@qq.com', 1),
(19, '481ee17', 'M', '481ee17@qq.com', 1),
(20, 'ca9e518', 'M', 'ca9e518@qq.com', 1),
(21, '4108f19', 'M', '4108f19@qq.com', 1),
(22, '08ce520', 'M', '08ce520@qq.com', 1),
(23, 'fa11821', 'M', 'fa11821@qq.com', 1),
(24, 'fd23122', 'M', 'fd23122@qq.com', 1),
(25, '8a55023', 'M', '8a55023@qq.com', 1),
(26, 'd1ea224', 'M', 'd1ea224@qq.com', 1),
(27, '7989625', 'M', '7989625@qq.com', 1),
(28, '98ebc26', 'M', '98ebc26@qq.com', 1),
(29, '267a227', 'M', '267a227@qq.com', 1),
(30, '4672728', 'M', '4672728@qq.com', 1),
(31, 'c383429', 'M', 'c383429@qq.com', 1),
(32, '7b55430', 'M', '7b55430@qq.com', 1),
(33, 'ef4dd31', 'M', 'ef4dd31@qq.com', 1),
(34, 'dbc4832', 'M', 'dbc4832@qq.com', 1),
(35, 'd7a6e33', 'M', 'd7a6e33@qq.com', 1),
(36, '69d1a34', 'M', '69d1a34@qq.com', 1),
(37, 'e97eb35', 'M', 'e97eb35@qq.com', 1),
(38, '2a5eb36', 'M', '2a5eb36@qq.com', 1),
(39, '6143637', 'M', '6143637@qq.com', 1),
(40, 'b67bf38', 'M', 'b67bf38@qq.com', 1),
(41, '8a85939', 'M', '8a85939@qq.com', 1),
(42, 'dad8a40', 'M', 'dad8a40@qq.com', 1),
(43, 'c36b841', 'M', 'c36b841@qq.com', 1),
(44, '8a0e942', 'M', '8a0e942@qq.com', 1),
(45, '7327d43', 'M', '7327d43@qq.com', 1),
(46, 'd38dd44', 'M', 'd38dd44@qq.com', 1),
(47, 'f0cd145', 'M', 'f0cd145@qq.com', 1),
(48, '693e546', 'M', '693e546@qq.com', 1),
(49, '2719647', 'M', '2719647@qq.com', 1),
(50, '0327548', 'M', '0327548@qq.com', 1),
(51, 'b7d2649', 'M', 'b7d2649@qq.com', 1),
(52, '8ab6050', 'M', '8ab6050@qq.com', 1),
(53, '2d9f951', 'M', '2d9f951@qq.com', 1),
(54, 'e8b3152', 'M', 'e8b3152@qq.com', 1),
(55, '565bf53', 'M', '565bf53@qq.com', 1),
(56, '6f1fb54', 'M', '6f1fb54@qq.com', 1),
(57, 'af47c55', 'M', 'af47c55@qq.com', 1),
(58, '6685e56', 'M', '6685e56@qq.com', 1),
(59, '6f31d57', 'M', '6f31d57@qq.com', 1),
(60, 'd04ed58', 'M', 'd04ed58@qq.com', 1),
(61, 'bd3cb59', 'M', 'bd3cb59@qq.com', 1),
(62, '1854a60', 'M', '1854a60@qq.com', 1),
(63, '9a47661', 'M', '9a47661@qq.com', 1),
(64, 'e111f62', 'M', 'e111f62@qq.com', 1),
(65, 'ec1f363', 'M', 'ec1f363@qq.com', 1),
(66, '7da2564', 'M', '7da2564@qq.com', 1),
(67, '091d265', 'M', '091d265@qq.com', 1),
(68, '440c466', 'M', '440c466@qq.com', 1),
(69, 'cf0a267', 'M', 'cf0a267@qq.com', 1),
(70, '5484468', 'M', '5484468@qq.com', 1),
(71, 'a641569', 'M', 'a641569@qq.com', 1),
(72, 'bff3770', 'M', 'bff3770@qq.com', 1),
(73, '2b7e971', 'M', '2b7e971@qq.com', 1),
(74, '5177172', 'M', '5177172@qq.com', 1),
(75, 'bdaa273', 'M', 'bdaa273@qq.com', 1),
(76, 'd6c7c74', 'M', 'd6c7c74@qq.com', 1),
(78, '885b476', 'M', '885b476@qq.com', 1),
(79, 'fffe577', 'M', 'fffe577@qq.com', 1),
(80, '5b7fa78', 'M', '5b7fa78@qq.com', 1),
(81, '68bf679', 'M', '68bf679@qq.com', 1),
(87, '94a1485', 'M', '94a1485@qq.com', 1),
(88, '44f3186', 'M', '44f3186@qq.com', 1),
(89, 'f4c2c87', 'M', 'f4c2c87@qq.com', 1),
(90, '1259488', 'M', '1259488@qq.com', 1),
(91, '5a85889', 'M', '5a85889@qq.com', 1),
(94, 'd8ca692', 'M', 'd8ca692@qq.com', 1),
(104, 'Neeal', 'M', 'neeal@qq.com', 2),
(118, 'nhsly', 'M', 'nhsly@qq.com', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_dept`
--
ALTER TABLE `tbl_dept`
  ADD PRIMARY KEY (`dept_id`);

--
-- Indexes for table `tbl_emp`
--
ALTER TABLE `tbl_emp`
  ADD PRIMARY KEY (`emp_id`),
  ADD KEY `fk_emp_dept` (`d_id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `tbl_dept`
--
ALTER TABLE `tbl_dept`
  MODIFY `dept_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `tbl_emp`
--
ALTER TABLE `tbl_emp`
  MODIFY `emp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
