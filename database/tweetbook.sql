-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 14, 2021 at 12:57 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tweetbook`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created`, `updated`) VALUES
(1, 'Travel', '2021-02-11 04:56:55', '2021-02-11 04:56:55'),
(2, 'Sports', '2021-02-11 04:57:17', '2021-02-11 04:57:17'),
(3, 'Family', '2021-02-11 04:57:28', '2021-02-11 04:57:28'),
(4, 'Wedding', '2021-02-14 04:00:48', '2021-02-14 04:00:48'),
(5, 'Birthday', '2021-02-14 04:00:48', '2021-02-14 04:00:48'),
(6, 'Date', '2021-02-14 04:01:10', '2021-02-14 04:01:10'),
(7, 'Milad', '2021-02-14 04:01:19', '2021-02-14 04:01:19'),
(8, 'Meeting', '2021-02-14 04:01:29', '2021-02-14 04:01:29'),
(9, 'Seminar', '2021-02-14 04:01:37', '2021-02-14 04:01:37'),
(10, 'Picnic', '2021-02-14 04:01:48', '2021-02-14 04:01:48'),
(11, 'Adda', '2021-02-14 04:01:54', '2021-02-14 04:01:54'),
(12, 'Workshop', '2021-02-14 04:02:01', '2021-02-14 04:02:01');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `tid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `comment` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE `profiles` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `first_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fat_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mot_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reacts`
--

CREATE TABLE `reacts` (
  `uid` int(11) NOT NULL,
  `tid` int(11) NOT NULL,
  `react` set('1','2','3','4','5','6') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tweets`
--

CREATE TABLE `tweets` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `title` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `privacy` set('0','1','2') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` set('0','1','2') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NULL DEFAULT NULL,
  `deleted` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tweets`
--

INSERT INTO `tweets` (`id`, `uid`, `cid`, `title`, `details`, `image`, `privacy`, `status`, `created`, `updated`, `deleted`) VALUES
(2, 2, 1, 'test', 'test1', '1613190626_2_8687.jpg', '1', '1', '2021-02-13 04:30:26', '2021-02-13 04:30:26', '2021-02-14 06:39:12'),
(3, 2, 2, '22', '2222', '1613190673_2_1857.jpg', '0', '1', '2021-02-13 04:31:13', '2021-02-13 04:31:13', '2021-02-14 06:39:18'),
(4, 2, 3, 'sadf 123', 'asdf 12312312323', '1613190749_2_5981.jpg', '2', '1', '2021-02-13 04:32:29', NULL, '2021-02-14 06:39:22'),
(5, 5, 2, 'মুশফিকের ফিফটি হতেই মিঠুন আউট', 'বাংলাদেশের জন্য ম্যাচটা কেমন হবে, সেটিই এই জুটির ওপর নির্ভর করছে বলে ভাবা হচ্ছিল। মুশফিকুর রহিম ও মোহাম্মদ মিঠুনের এই জুটি অক্ষত রেখে ফলোঅন এড়ানোই হয়তো বাংলাদেশের মূল লক্ষ্য ছিল আজ মিরপুর টেস্টের তৃতীয় দিন সকালে । হাতে ৬ উইকেট থাকলে এরপর না হয় প্রথম ইনিংসে ওয়েস্ট ইন্ডিজের ৪০৯ রানের পাহাড়ের কাছে যাওয়ার চেষ্টা করা যেত।\r\n\r\nকিন্তু সে আশা আর পূরণ হলো কই? আপাতত ফলোঅন এড়ানোর চেষ্টায় বাংলাদেশকে টেনে নিয়ে যাচ্ছেন মুশফিক, পেয়ে গেছেন ফিফটি। কিন্তু সকাল থেকে পরীক্ষার মুখে পড়া মিঠুন ফিরে গেছেন মুশফিক ফিফটি পাওয়ার পরপরই। \r\n\r\nপঞ্চম উইকেটে দুজনের জুটিটা হয়েছে ৮১ রানের। এই মুহূর্তে মুশফিক অপরাজিত ৫০ রানে, মিঠুন ১৫ রান করে আউট হয়ে গেছেন। ক্রিজে মুশফিকের সঙ্গী লিটন দাস। বাংলাদেশের রান ৫ উইকেটে ১৪৩।\r\n\r\nদিনের দশম ওভারের প্রথম বলেই ফিরে গেছেন মিঠুন। কর্নওয়ালের অফ স্টাম্পে করা বলটা প্যাডের ওপর থেকে টেনে খেলতে চেয়েছিলেন, কিন্তু টাইমিং গড়বড় হওয়ায় ধরা পড়েন শর্ট মিডউইকেটে।\r\n\r\n', '1613191027_5_7751.jpg', '1', '1', '2021-02-13 04:37:07', NULL, NULL),
(8, 4, 2, 'HeadPhone', 'Headphone or Headset. Headphone is as a small pair of loudspeakers that convert an electrical signal to a corresponding sound worn on or around the head ..', '1613191071_4_1865.jpg', '1', '1', '2021-02-13 04:37:51', NULL, NULL),
(9, 5, 3, 'উসকানি দেওয়ার অভিযোগ ‘ভয়ংকর মিথ্যা’: ট্রাম্পের আইনজীবী', 'অভিশংসন বিচারে সাবেক মার্কিন প্রেসিডেন্ট ডোনাল্ড ট্রাম্পের পক্ষে যুক্তি তুলে ধরেছেন তাঁর আইনজীবীরা। তাঁরা বলেছেন, ক্যাপিটল হিলে হামলার ঘটনায় ট্রাম্পের উসকানি দেওয়ার অভিযোগ ‘ভয়ংকর মিথ্যা’। ট্রাম্পের আইনজীবী মিখাইল ভন দের ভিন অভিশংসনের বিচারকাজকে ডেমোক্র্যাটদের রাজনৈতিক উদ্দেশ্যপ্রণোদিত বলে অভিযোগ করেছেন।\r\n\r\n সিনেটে বেশির ভাগ রিপাবলিকান বলেছেন, ট্রাম্পকে দোষী সাব্যস্ত করতে তাঁরা ভোট দেবেন না। ট্রাম্পের পক্ষের আইনজীবীদের জন্য বরাদ্দ ছিল ১৬ ঘণ্টা। নির্ধারিত সময়ের চার ঘণ্টা আগেই তাঁরা ট্রাম্পের পক্ষে যুক্তি তুলে ধরেন। তাঁরা অভিশংসন বিচারকাজ দ্রুত শেষ করার চেষ্টা করেন।\r\n\r\n ট্রাম্পের আইনজীবীরা বলেন, সাবেক প্রেসিডেন্টের বিরুদ্ধে আনা কোনো অভিযোগই আমলযোগ্য নয়। ট্রাম্প সহিংসতার জন্য কোনো নির্দেশ দেননি। সশস্ত্র হামলার মধ্য দিয়ে তিনি রাষ্ট্রক্ষমতা দখলের কোনো চেষ্টা করেননি। ট্রাম্প মার্কিন সংবিধানে নিশ্চিত করা মতপ্রকাশের স্বাধীনতার সঠিক ব্যবহার করেছেন। ক্ষমতা থেকে চলে যাওয়ার পর কোনো মার্কিন প্রেসিডেন্টের বিরুদ্ধে অভিশংসন দণ্ড আরোপ করা যায় না।', '1613191092_5_2879.jpg', '1', '1', '2021-02-13 04:38:12', NULL, NULL),
(10, 9, 2, 'football sports', 'this is well game', '1613191110_9_6098.jpg', '0', '1', '2021-02-13 04:38:30', NULL, NULL),
(11, 7, 3, 'Bitcoin', 'Bitcoin is a cryptocurrency invented in 2008 by an unknown person or group of people using the name Satoshi Nakamoto. The currency began use in 2009 when its implementation was released as open-source software.\r\n\r\nToday Bdt Price : 4,051,513.26 ', '1613191115_7_6444.jpg', '1', '1', '2021-02-13 04:38:35', NULL, NULL),
(12, 10, 1, 'অক্সফোর্ডের ভ্যাকসিন সম্পর্কে আপনার যা জানা দরকার', 'প্রথমে কাদের টিকা দেয়া উচিত?\r\n\r\nভ্যাকসিন সরবরাহ সীমাবদ্ধ থাকা সত্ত্বেও করোনা মোকাবিলার সম্মুখসারির যোদ্ধা স্বাস্থ্যকর্মী এবং ৬৫ বা তার বেশি বয়সী ঝুঁকির মধ্যে থাকাদের অগ্রাধিকার দেয়া উচিত বলে সুপারিশ করা হয়।', '1613191134_10_4965.jpg', '1', '1', '2021-02-13 04:38:54', NULL, NULL),
(13, 6, 3, 'বরিশালে বৌভাত অনুষ্ঠানে মাংস নিয়ে মারামারি', 'বরিশালে একটি বউভাত অনুষ্ঠানের খাবারে মাংস কম দেওয়াকে কেন্দ্র করে বরপক্ষের সঙ্গে কনেপক্ষের মারামারি হয়। এতে বরের চাচা আজহার মীর (৬৫) মারা যান। গতকাল মঙ্গলবার বিকেলে বরিশালের বাবুগঞ্জ উপজেলার দক্ষিণ রফিয়াদি গ্রামে এ ঘটনা ঘটে।\r\n', '1613191154_6_2941.jpg', '1', '1', '2021-02-13 04:39:14', NULL, NULL),
(14, 4, 3, 'অনলাইনে বিক্রির ধুম', 'দেশে অনলাইনে পণ্য কেনাবেচা বা ই-কমার্স ব্যবসা এমনিতেই দিন দিন বাড়ছিল। করোনার আতঙ্ক সেই গতি অনেক বাড়িয়ে দিয়েছে। নিরাপদ ও স্বচ্ছন্দে থাকার জন্য মানুষ ঘরে বসে অনলাইনে পণ্য কেনাকাটায় ঝুঁকছেন। মানুষের অনলাইননির্ভর কেনাকাটায় নতুন মাত্রা যোগ করেছে পয়লা ফাল্গুন বা বসন্ত উৎসব ও ভ্যালেন্টাইনস ডে বা বিশ্ব ভালোবাসা দিবস। করোনায় ফিকে হয়ে যাওয়া জীবনে উৎসবের রং যেন আবার ঝলমল করছে। উৎসবের এ সুবাতাস বইছে অনলাইন কেনাকাটায়। তাতে বিভিন্ন ই-কমার্স প্রতিষ্ঠান এবং ফেসবুকভিত্তিক উদ্যোক্তারাও উৎসবে ব্যবহার্য পণ্যের পসরা সাজিয়ে রেখেছেন।\r\n\r\nফেসবুকভিত্তিক পোশাকের দোকান পটের বিবির স্বত্বাধিকারী ফোয়ারা ফেরদৌস প্রথম আলোকে জানান, ‘এরই মধ্যে ৭০ শতাংশ পণ্য বিক্রি হয়ে গেছে। গতবারের তুলনায় এ বছর অনেক বেশি কাজ করেছি। ভালো সাড়া পাচ্ছি। কিছু পণ্য একদম স্টক-আউট হয়ে গেছে।’', '1613191182_4_6118.jpg', '1', '1', '2021-02-13 04:39:42', NULL, NULL),
(16, 5, 3, 'অনলাইনে বিক্রির ধুম', 'পয়লা ফাল্গুন ও বিশ্ব ভালোবাসা দিবস উপলক্ষে ক্রেতারা ই-কমার্স প্রতিষ্ঠানগুলোর কাছ থেকে প্রচুর পরিমাণ পণ্য কিনছেন।\r\n\r\n২০২০ সালে দেশে অনলাইনে ১৬ হাজার কোটি টাকার পণ্য বিক্রি হয়।\r\n\r\nকরোনাকালে ফেসবুকভিত্তিক উদ্যোক্তা যুক্ত হয়েছে ৫০ হাজারের বেশি। দেশে অনলাইনে পণ্য কেনাবেচা বা ই-কমার্স ব্যবসা এমনিতেই দিন দিন বাড়ছিল। করোনার আতঙ্ক সেই গতি অনেক বাড়িয়ে দিয়েছে। নিরাপদ ও স্বচ্ছন্দে থাকার জন্য মানুষ ঘরে বসে অনলাইনে পণ্য কেনাকাটায় ঝুঁকছেন। মানুষের অনলাইননির্ভর কেনাকাটায় নতুন মাত্রা যোগ করেছে পয়লা ফাল্গুন বা বসন্ত উৎসব ও ভ্যালেন্টাইনস ডে বা বিশ্ব ভালোবাসা দিবস। করোনায় ফিকে হয়ে যাওয়া জীবনে উৎসবের রং যেন আবার ঝলমল করছে। উৎসবের এ সুবাতাস বইছে অনলাইন কেনাকাটায়। তাতে বিভিন্ন ই-কমার্স প্রতিষ্ঠান এবং ফেসবুকভিত্তিক উদ্যোক্তারাও উৎসবে ব্যবহার্য পণ্যের পসরা সাজিয়ে রেখেছেন।\r\n\r\nফেসবুকভিত্তিক পোশাকের দোকান পটের বিবির স্বত্বাধিকারী ফোয়ারা ফেরদৌস প্রথম আলোকে জানান, ‘এরই মধ্যে ৭০ শতাংশ পণ্য বিক্রি হয়ে গেছে। গতবারের তুলনায় এ বছর অনেক বেশি কাজ করেছি। ভালো সাড়া পাচ্ছি। কিছু পণ্য একদম স্টক-আউট হয়ে গেছে।’', '1613191199_5_2666.jpg', '1', '1', '2021-02-13 04:39:59', NULL, NULL),
(17, 7, 3, 'PHP', 'PHP is a general-purpose scripting language especially suited to web development. It was originally created by Danish-Canadian programmer Rasmus Lerdorf in 1994. ', '1613191222_7_5826.jpg', '1', '1', '2021-02-13 04:40:22', NULL, NULL),
(19, 9, 1, 'Brain cells could reveal how your mind differs from Neanderthal’s', 'Scientists have figured out how to grow blobs of hundreds of thousands of live human neurons that look and act something like a brain', '1613191240_9_8925.jpg', '1', '1', '2021-02-13 04:40:40', NULL, NULL),
(20, 5, 1, 'গোলাপ গ্রামে এখন ফুলের মেলা', 'গ্রামের বুক চিরে চলে গেছে আঁকাবাঁকা পথ। দুপাশে গোলাপের বিস্তীর্ণ বাগান। তাই তো সাভার উপজেলার বিরুলিয়া ইউনিয়নের শ্যামপুর, সাদুল্লাহপুর, মৈস্তাপাড়া, বাগ্নিবাড়ি, বাটুলিয়া, কমলাপুর ও আরাবাগ এখন ‘গোলাপ গ্রাম’ নামেই সমধিক পরিচিত। অবশ্য গোলাপের মাঝেমধ্যে কিছু গ্ল্যাডিওলাস, চন্দ্রমল্লিকা, জিপসি ও জারাবেরার বাগানও রয়েছে এসব গ্রামে। বসন্ত উৎসব ও বিশ্ব ভালোবাসা দিবস উপলক্ষে সব ধরনের ফুলের প্রধান গন্তব্য ঢাকা।\r\n\r\nউপজেলা কৃষি কর্মকর্তার কার্যালয় সূত্রে জানা গেছে, বিরুলিয়ার গ্রামগুলোতে ৩৫০ হেক্টর জমিতে গোলাপের চাষ হয়েছে। আর গোলাপ চাষে জড়িত আছেন প্রায় দেড় হাজার কৃষক। গোলাপ বিক্রির জন্য শ্যামপুর ও মৈস্তাপাড়ায় গড়ে উঠেছে ফুলের বাজার। চাষিরা বাগান থেকে ফুল তুলে বিকেলের মধ্যেই বাজারে নিয়ে যান। প্রতিদিন সন্ধ্যা সাতটা থেকে ১০টা পর্যন্ত চলে ফুল বেচাকেনা। স্থানীয় ফড়িয়ারা দুই বাজার থেকে ফুল কিনে সরাসরি রাজধানীর বিভিন্ন স্থানে নিয়ে বিক্রি করেন।\r\n\r\nশ্যামপুরের কৃষক জাহাঙ্গীর আলম বলেন, ফুলের বাজার সবচেয়ে ভালো যায় আগস্ট থেকে মার্চ পর্যন্ত আট মাস।\r\n\r\nআরেক কৃষক আবু সাঈদ বলেন, ১৬ ডিসেম্বর, খ্রিষ্টীয় নববর্ষ, পয়লা ফাল্গুন, ভালোবাসা দিবস, ২১ ফেব্রুয়ারি ও ২৬ মার্চ—এসব দিবসেই সবচেয়ে বেশি বিক্রি হয়। এসব উৎসবের সময় প্রতিটি গোলাপ পাঁচ থেকে আট টাকায় বিক্রি হয়। এপ্রিল-জুলাই চার মাসে প্রতিটি গোলাপ বিক্রি হয় ২৫ পয়সা থেকে সর্বোচ্চ ২ টাকায়।\r\n\r\nচাষিরা জানান, গোলাপের চাহিদা ও দাম কমে যাওয়ার কারণে তাঁরা অনেকেই ইতিমধ্যে গ্ল্যাডিওলাস, জারাবেরাসহ অন্যান্য ফুলের আবাদ শুরু করেছেন।\r\n\r\nভবানীপুরের কৃষক বশির আহমেদ আগে গোলাপের আবাদ করলেও এবার আরাবাগে পাঁচ বিঘা জমিতে জারবেরা চাষ করেছেন। তিনি বলেন, পাঁচ বিঘা জমি থেকে প্রতি মাসে চার-পাঁচ লাখ টাকার ফুল বিক্রি হবে বলে আশা তাঁর।\r\n\r\n', '1613191275_5_1063.jpg', '1', '1', '2021-02-13 04:41:15', NULL, NULL),
(21, 4, 3, '‘যদি তথ্য থাকত, সরকার ব্যবস্থা নিত’', 'সাংবাদিক টিম সেবাস্টিয়ানের উপস্থাপনায় গত বুধবার জার্মানির গণমাধ্যম ডয়চে ভেলেতে প্রচারিত টক শো ‘কনফ্লিক্ট জোন’-এ অতিথি ছিলেন বাংলাদেশের প্রধানমন্ত্রীর আন্তর্জাতিক সম্পর্কবিষয়ক উপদেষ্টা গওহর রিজভী। কাতারভিত্তিক সংবাদমাধ্যম আল-জাজিরায় ১ ফেব্রুয়ারি প্রচারিত ‘অল দ্য প্রাইম মিনিস্টারস মেন’ শীর্ষক তথ্যচিত্র নিয়ে কথা বলেছেন গওহর রিজভী। ডয়চে ভেলে বাংলায় প্রকাশিত অংশটুকু তুলে ধরা হলো:\r\n\r\nগওহর রিজভী: তদন্ত চলছে। তদন্ত করা হচ্ছে। আন্তরিকতার সঙ্গে আপনাকে বলতে চাই, তথ্যচিত্রের শিরোনাম ছিল ‘অল দ্য প্রাইম মিনিস্টারস মেন’। আর আমাদের বলা হলো যে এতে প্রধানমন্ত্রীকে ঘিরে হওয়া দুর্নীতি প্রকাশ করা হবে। আপনি কি আসলেই বিশ্বাস করেন যে এই তথ্যচিত্রে তা করা হয়েছে? সেখানে কি এমন একটি প্রমাণও আনতে পেরেছে, যাতে প্রধানমন্ত্রীর বিরুদ্ধে দুর্নীতির অভিযোগ আনা যায়? সে কারণে আমি মনে করি, সচেতন একাডেমিক ও সাংবাদিক হিসেবে আমাদের পেছনে ফিরে তাকিয়ে নিজেদের প্রশ্ন করতে হবে, প্রধানমন্ত্রীর দুর্নীতিতে জড়িয়ে থাকার কী প্রমাণ দেওয়া হয়েছে? তারপরও এই তথ্যচিত্রে শাসনব্যবস্থা কত দুর্নীতিগ্রস্ত, তা দেখানো হয়েছে বলে বলা হচ্ছে।\r\n\r\nটিম সেবাস্টিয়ান: তথ্যচিত্রে দেখানো হয়েছে যে আল-জাজিরা হত্যার দায়ে অভিযুক্ত দুজন পলাতক আসামির অবস্থান নির্ণয়ে সক্ষম হয়েছে। দুই আসামির ভাই আপনাদের সেনাবাহিনীর প্রধান জেনারেল আজিজ আহমেদ। এটা আপনাদের জন্য বড় অস্বস্তির, তাই নয় কি?\r\n\r\nগওহর রিজভী: অবশ্যই। কিন্তু অন্যদিকে আবার বলছি, আমি সবকিছু ডিফেন্ড করতে যাচ্ছি না। তবে আপনি যেভাবে আমাকে প্রশ্ন করেছেন, তাতে মনে হয় এটা প্রয়োজনীয়। একজন মানুষকে কি তার ভাইয়ের অপরাধ দিয়ে বিচার করা উচিত? আমার মনে হয়, আমাদের এই প্রশ্নটা জিজ্ঞাসা করা উচিত। এখন সেনাবাহিনীতে থাকা ভাইটি যদি তাঁর ভাইদের বিচার এড়াতে সাহায্য করেন, তাহলে এ অভিযোগ খুবই বৈধ হবে। অথচ যা ঘটেছে, তা এই ভদ্রলোক সেনাপ্রধান হওয়ার বহুদিন আগে ঘটেছে।', '1613191301_4_2133.jpg', '1', '1', '2021-02-13 04:41:41', NULL, NULL),
(22, 10, 2, 'বাংলাদেশ ফলোঅন এড়াতে পারবে?', 'তৃতীয় দিনের খেলা শুরু হয়ে গেছে। আগের দিনের দুই অপরাজিত ব্যাটসম্যান মুশফিকুর রহিম ও মোহাম্মদ মিঠুনের জুটিতে ভরসা রেখেছিল বাংলাদেশ। ৪ উইকেটে ১০৫ রান নিয়ে দিন শুরু করা বাংলাদেশের জন্য আদর্শ হতো যদি এই জুটিতেই ফলোঅনের জন্য দরকারি বাকি ১০৫ রান চলে আসত। কিন্তু সেটি আর হলো কই!  ', '1613191323_10_7976.jpg', '1', '1', '2021-02-13 04:42:03', NULL, NULL),
(24, 9, 1, 'বেসামরিক সরকারের কাছে ক্ষমতা হস্তান্তরে মিয়ানমারকে জাতিসংঘের চাপ', 'জাতিসংঘের শীর্ষ মানবাধিকার সংস্থা হিউম্যান রাইটস ওয়াচ (এইচআরডব্লিউ)।\r\n\r\n\r\nএমন এক সময় জাতিসংঘ এই ইস্যুতে সরব হলো যখন জান্তা শাসনের বিরুদ্ধে দক্ষিণপূর্ব এশিয়ার দেশটিতে সপ্তমদিনের মতো গণবিক্ষোভ অব্যাহত রয়েছে।\r\n\r\nব্রিটেন ও ইউরোপীয় ইউনিয়নের অনুরোধে এক বিরল বিশেষ অধিবেশনে মিয়ানমারে নির্বাচিত সরকারের হাতে ক্ষমতা হস্তান্তর ও নির্বিচারে আটক সব বন্দির মুক্তির দাবি জানিয়ে একটি প্রস্তাব গ্রহণ করেছে এইচআরডব্লিউ।\r\n\r\nঅধিবেশনের শুরুতে জাতিসংঘের উপ-মানবাধিকার প্রধান নাদা আল-নাসিফ বলেন, মিয়ানমারে যা ঘটছে, বিশ্ব তা দেখছে।\r\n\r\nপহেলা ফেব্রুয়ারিতে অভ্যুত্থানের পর সু চি ও উইন মিন্টসহ সাড়ে ৩০০ লোককে আটক রেখেছে সামরিক সরকার। যাদের মধ্যে সাংবাদিক, শিক্ষার্থী, সন্ন্যাসী ও মানবাধিকারকর্মীও আছেন। \r\n\r\nনাদা আল-নাসিফ বলেন, শান্তিপূর্ণ জমায়েত বন্ধ রাখতে ও বাকস্বাধীনতা হরণে কঠোর নির্দেশ দিয়েছে সেনাবাহিনী। বিক্ষোভকারীদের সরিয়ে দিতে প্রাণঘাতী অস্ত্র ব্যবহারেরও নিন্দা জানিয়েছেন তিনি।', '1613191346_9_5617.jpg', '0', '1', '2021-02-13 04:42:26', NULL, NULL),
(25, 4, 2, 'নৌকায় ভোট না দিলে এলাকা ছাড়ুন', 'ভোট ঘনিয়ে এলেই কেন্দ্রে না আসতে ভোটারদের ভয় দেখানোর বিস্তর অভিযোগ ওঠে। বিরোধী পক্ষের লোকজনকে এলাকা ছাড়ার হুমকির কৌশলটিও কিছুটা পুরোনো। এই সবই চলত অনেকটা গোপনে। তবে এবার পৌরসভা নির্বাচনে সরকারদলীয় নেতাদের মুখের পর্দা যেন খসে পড়েছে। তাঁরা প্রকাশ্য সভায় হুমকি দিচ্ছেন, নৌকায় ভোট না দিলে এলাকা ছাড়তে বলছেন, প্রকাশ্যে নৌকায় ভোট দেওয়ার কথা বলছেন।\r\n\r\nসর্বশেষ ঠাকুরগাঁও পৌরসভায় নির্বাচনী প্রচারণায় প্রকাশ্য হুমকি দিয়ে সামাজিক যোগাযোগমাধ্যমে আলোচিত হয়েছেন কেন্দ্রীয় মহিলা আওয়ামী লীগের সাধারণ সম্পাদক মাহমুদা বেগম। গত বৃহস্পতিবার শহরের ২ নম্বর ওয়ার্ডে এক নির্বাচনী সভায় মাহমুদা বেগম বলেন, ‘যাঁদের মনে ধানের শীষের সঙ্গে প্রেম আছে, তাঁরা কী করবেন? ১৩ তারিখে ঠাকুরগাঁও ছেড়ে চলে যাবেন। ১৩ তারিখ সন্ধ্যার পরে তাঁদের দেখতে চাই না। তাঁদের ভোটকেন্দ্রে আসার কোনো প্রায়োজন নাই। তাহলে ভোটকেন্দ্রে যাবে শুধু কে? নৌকা, নৌকা আর নৌকা।’\r\n\r\n১৪ ফেব্রুয়ারি ঠাকুরগাঁও পৌরসভায় ভোট। ঠাকুরগাঁওয়ে নৌকার প্রার্থী আঞ্জুমান আরা বেগম মহিলা আওয়ামী লীগের কেন্দ্রীয় সদস্য। এ কারণে তাঁর পক্ষে প্রচারণা চালাতে মহিলা আওয়ামী লীগের কেন্দ্রীয় সভাপতি সাফিয়া খাতুন ও সম্পাদক মাহমুদা কয়েক দিন ধরে ঠাকুরগাঁওয়ে রয়েছেন।\r\n\r\nএর আগে বুধবার আরেক পথসভায় মাহমুদা বলেন, ‘সুস্পষ্ট ভাষায় বলতে চাই, যাঁরা নৌকায় ভোট দিতে না চান, ১৩ তারিখ সন্ধ্যার পরে আপনাদের চেহারা এলাকায় দেখতে চাই না। কোথায় যাবেন আমি জানি না। তবে ঠাকুরগাঁওয়ে থাকতে পারবেন না। যাঁরা নৌকায় ভোট না দেবেন, তাঁরা ঠাকুরগাঁও থেকে বিদায় নেবেন।’\r\n\r\nনেতা–কর্মীদের উদ্দেশে মহিলা আওয়ামী লীগের এই নেত্রী বলেন, ‘একদম পরিষ্কার ভাষায় বলতে চাই, খাইদাই আমি জব্বারের, গান সালামেরটা গাইব না। কালকে থেকে রাস্তায় কোনো ধানের শীষের পোস্টার আমরা দেখতে চাই না। ধান বলে কোনো কথা নাই। ধানের শীষ বলে কোনো কথা নাই। আমরা শুধু দেখতে চাই নৌকা আর নৌকা। যদি ধান থাকে, তবে ধরে নেব এখানে আওয়ামী লীগ নাই।’\r\n\r\nবক্তব্যের বিষয়ে মাহমুদা বেগমের সঙ্গে যোগাযোগ করা সম্ভব হয়নি। তবে এ বিষয়ে আওয়ামী লীগের প্রার্থী আঞ্জুমান আরা বেগম প্রথম আলোকে বলেন, ‘পৌরসভায় ধানের শীষের ভোট তলানিতে ঠেকেছে। নিশ্চিত পরাজয় জেনে মাহমুদা আপার বক্তব্য এডিট করে বিএনপির লোকজন ছড়িয়ে দিতে পারে। আওয়ামী লীগের নেতা-কর্মীরা কোথাও এ ধরনের বক্তব্য দিচ্ছেন না।’\r\n\r\nআর ধানের শীষের প্রার্থী শরিফুল ইসলামের অভিযোগ, মহিলা আওয়ামী লীগের সাধারণ সম্পাদক মাহমুদা বেগমসহ আওয়ামী লীগের নেতাদের এমন প্রকাশ্য বক্তব্যের পর ধানের শীষের কর্মীদের ভয় দেখানো হচ্ছে। সাধারণ ভোটাররাও এতে শঙ্কিত। ভোটারদের হুমকি দেওয়ার ভিডিওর সিডিসহ রিটার্নিং কর্মকর্তার কাছে লিখিত অভিযোগ জানানো হচ্ছে।\r\n\r\nতবে জেলা রিটার্নিং কর্মকর্তা জিলহাজ উদ্দিন অভিযোগ পাওয়ার বিষয়টি অস্বীকার করে গতকাল প্রথম আলোকে বলেন, পথসভায় ভোটারদের এলাকা ছাড়ার হুমকির বিষয়টি তাঁর জানা নেই।', '1613191354_4_6270.jpg', '1', '1', '2021-02-13 04:42:34', NULL, NULL),
(26, 7, 3, 'What Are Altcoins?', 'Altcoins are the other cryptocurrencies launched after the success of Bitcoin. Generally, they sell themselves as better alternatives to Bitcoin. The term \"altcoins\" refers to all cryptocurrencies other than Bitcoin. As of early 2020, there were more than 5,000 cryptocurrencies by some estimates. According to CoinMarketCap, altcoins accounted for over 34% of the total cryptocurrency market in February 2020.', '1613191358_7_5621.jpg', '1', '1', '2021-02-13 04:42:38', NULL, NULL),
(27, 5, 3, 'সৌন্দর্য চর্চায় টমেটোর দুই উপায় Dedicated By Round-45 Women', 'নিয়মিত ভারী মেকআপ, চটকদার নানা পণ্যের ব্যবহার আমাদের ত্বক নষ্ট করে দিতে পারে। এ ছাড়া এই মৌসুমের ঠান্ডা পানি, দুশ্চিন্তা, ধুলোবালি লেগেও ত্বক তার স্বাভাবিক সৌন্দর্য হারিয়ে ফেলে। বাজারে নানা ব্র্যান্ডের ফেইস ক্লিনজার বা ফেইসওয়াশ পাওয়া যায়। তবে প্রাকৃতিক উপাদান দিয়ে নিজেই ঘরে বানিয়ে ফেলতে পারেন ফেইস ক্লিনার বা টোনার। যা আপনার ত্বকে ক্ষতিকর কেমিক্যাল থেকে সুরক্ষা দেবে। এখানে থাকছে তেমন একটি টোনার তৈরির উপায়।  একটা পরিষ্কার ব্লেন্ডারের ভেতর একটা ছোট শসা ও একটা বড় টমেটো দিন। এবার সেটা ভালোমতো ব্লেন্ড করে একটি মিশ্রণ তৈরি করুন। হয়ে গেলে একটা বয়ামে ভরে এই মিশ্রণটি ফ্রিজে রেখে তিন দিন পর্যন্ত সংরক্ষণ করা যাবে। এই টোনার একটু তুলা বা সুতি পরিষ্কার নরম কাপড়ের সাহায্যে মুখ ও ঘাড়ে লাগিয়ে নিন। মুখে লাগিয়ে পাঁচ মিনিট অপেক্ষা করুন। এরপর কুসুম গরম পানি দিয়ে মুখ ও ঘাড় ধুয়ে ফেলুন। টমেটোতে থাকা অ্যান্টি অক্সিডেন্ট ত্বকের নানা রকম ক্ষতিকর র‌্যাডিকেলস দূর করে। ত্বক করে তোলে কোমল ও স্বাস্থ্যকর। সূর্যের তাপে যাদের ত্বকে জ্বালা অনুভব করেন এই টোনার তাদের জন্য দরুন কার্যকর।', '1613191389_5_1605.jpg', '1', '1', '2021-02-13 04:43:09', NULL, NULL),
(28, 6, 3, 'দুই প্রেমিকাকে একই সঙ্গে বিয়ে করলেন ছত্তিশগড়ের যুবক', 'দুই নারীর সঙ্গে প্রেমের সম্পর্ক, তারপর তাদের দুজনকে একই সঙ্গে বিয়ে করলেন এক যুবক - ভারতের ছত্তিশগড় রাজ্যে কদিন আগের এরকমই এক ঘটনা নিয়ে এখন আলোচনা হচ্ছে।', '1613191406_6_5132.jpg', '1', '1', '2021-02-13 04:43:26', NULL, NULL),
(31, 9, 3, 'বুয়েটের আবরারের জন্মদিনে ছোট ভাইয়ের আবেগঘন স্ট্যাটাস', 'ছাত্রলীগ নেতাকর্মীদের হাতে নৃশংসভাবে হত্যাকাণ্ডের শিকার বাংলাদেশ প্রকৌশল বিশ্ববিদ্যালয়ের (বুয়েট) মেধাবী ছাত্র আবরার ফাহাদের জন্মদিন ছিল ১২ ফেব্রুয়ারি।\r\n\r\n\r\nদিনটি উপলক্ষ্যে তার ছোট ভাই আবরার ফাইয়াজ সামাজিক যোগাযোগমাধ্যম ফেসবুকে একটি আবেগঘন স্ট্যাটাস দিয়েছেন। \r\n\r\nশুক্রবার নিজের ফেসবুক আইডি থেকে দেওয়া ওই স্ট্যাটাসটি পাঠকদের জন্য হুবহু তুলে ধরা হলো-\r\n\r\n‘আজকে ১২ ফেব্রুয়ারি, ২০২১। ভাইয়ার জন্মদিন। ওর বয়স ২৩ বছর হতো আজ।\r\n\r\nকিন্তু প্রায় দেড় বছর হলো ও চলে গেছে। এখন শুধু ওর কিছু স্মৃতি বাদে আর কিছুই নেই আমাদের কাছে। একটা কবর আছে, কিন্তু সেটাও অনেক পুরনো হয়ে গেছে। অনেকেই ভুলে গেছে কে ‘আবরার ফাহাদ’', '1613191438_9_2275.jpg', '2', '1', '2021-02-13 04:43:58', NULL, NULL),
(32, 3, 3, 'দ্রুতগতির ইন্টারনেট পাবে দেশের ২৬০০ ইউনিয়ন', 'প্রকল্পটির লক্ষ্য ও উদ্দেশ্য হিসেবে বলা হয়েছে, ২ হাজার ৬০০ ইউনিয়নে ১৯ হাজার ৫০০ কিলোমিটার অপটিক্যাল ফাইবার কেবলের মাধ্যমে নেটওয়ার্ক সম্প্রসারণ করা হবে। ইউনিয়ন পর্যায়ে বিভিন্ন দপ্তর, বিদ্যালয়, কলেজ, গ্রোথসেন্টার ও অন্য সরকারি কার্যালয়গুলোতে নেটওয়ার্ক সংযোগ স্থাপন করা হবে', '1613191456_3_9633.jpg', '1', '1', '2021-02-13 04:44:16', NULL, NULL),
(34, 5, 3, 'দই খাবেন?', 'ভরপেটে খাওয়ার পর দই না খেলে যেন খাওয়াটাই পূর্ণ হয় না। কেবল খাওয়া শেষেই নয়, অন্যান্য সময়েও হালকা খাবার হিসেবে দইয়ের সমাদর কম নয়। প্রায় চার হাজার বছর আগে ভারতীয় উপমহাদেশ ও মধ্যপ্রাচ্যে প্রথম প্রচলন শুরু হয় দুধজাত এই সুস্বাদু খাবারের। এরপর ধীরে ধীরে বিশ্বজুড়েই জনপ্রিয় হয়ে ওঠে। তবে আজকাল যে দই বলতেই আমরা বুঝে থাকি নানা স্বাদ, রং, গন্ধের হিমায়িত দই; তার ইতিহাস কিন্তু খুব পুরোনো নয়। যুক্তরাষ্ট্রের দুগ্ধজাত পণ্য উৎপাদনকারী প্রতিষ্ঠান এইচপি হুড এলএলসি গত শতকের ৭০-এর দশকে প্রথম হিমায়িত দইয়ের ধারণাটি নিয়ে আসে। হালকা আপ্যায়নের খাবার হিসেবে এটি বানিয়েছিল তারা। একে তখন বলা হতো ফ্রোগার্ট অর্থাৎ ফ্রোজেন ইয়োগার্ট। একই সঙ্গে আইসক্রিমের স্বাদ, শরীরের জন্য উপকারী এবং চর্বি কমানোর জন্য কার্যকর খাবার হওয়ায় অল্প দিনেই দারুণ জনপ্রিয়তা পায় হিমায়িত দই। আইসক্রিম কোম্পানি টিসিবিওয়াই খাবারটির এমন কাটতি দেখে ১৯৮১ সালে রীতিমতো দোকান খুলে বসে।\r\n\r\nআজ ৬ ফেব্রুয়ারি, হিমায়িত দই দিবস। যুক্তরাষ্ট্রে প্রতিবছর দিবসটি পালিত হয়।', '1613191487_5_4518.jpg', '1', '1', '2021-02-13 04:44:47', NULL, NULL),
(35, 4, 3, 'রক্ত দিয়ে পরীকে ‘আই লাভ ইউ’ লিখেছিল যুবকটি', 'কথায় আছে, প্রথম প্রেম বা প্রথম প্রেমের প্রস্তাব পাওয়ার স্মৃতি ভোলা যায় না। ভুলতে পারেননি এই সময়ের জনপ্রিয় চিত্রনায়িকা পরীমনিও। তাইতো বিশ্ব ভালোবাসা দিবসকে সামনে রেখে সেই প্রথম প্রেমের প্রস্তাব পাওয়ার গল্প শোনালেন তিনি। যদিও বিস্তারিত কিছু জানাননি নায়িকা। শুধু সেই প্রস্তাবটা কীভাবে পেয়েছেন সেটুকু জানিয়েছেন।\r\n\r\nপরী তখন পিরোজপুর ভগিরাতপুর মাধ্যমিক বিদ্যালয়ের নবম শ্রেণিতে পড়েন। তার নানা ছিলেন ওই স্কুলের প্রধান শিক্ষক। তাই স্কুলে নায়িকার দাপটটাও ছিল বেশি। একদিন জুলিয়া নামের এক বান্ধবীর কাছে তিনি জানতে পারেন, পাশের গ্রামের এক যুবক পরীকে পছন্দ করে। পরীকে সে আপন করে পেতে চায়।\r\nঅভিনেত্রীয় কথায়, ‘এরপর খেয়াল করে দেখলাম, একটা ছেলে মোটরসাইকেল নিয়ে দূরে দাঁড়িয়ে আছে। এভাবে একদিন, দুইদিন করে বেশ কিছুদিন চলে গেল। প্রতিদিন ছেলেটিকে এভাবে দাঁড়িয়ে থাকতে দেখে মায়া হলো। সিদ্ধান্ত নিলাম, ছেলেটির সঙ্গে কথা বলব। হঠাৎ একদিন ছেলেটি জুলিয়াকে দিয়ে একটা কার্ড পাঠায়। সেখানে রক্ত দিয়ে লেখা, ‘আই লাভ ইউ’।’\r\n\r\nজীবনে প্রথমবার প্রেমের প্রস্তাব পেয়ে, তাও আবার রক্তে লেখা কার্ডে- কেমন লেগেছিল পরীমনির। সেই অনুভূতির কথা অবশ্য জানাতে নারাজ নায়িকা। তিনি বলেন, ‘এ অনুভূতি আমার নিজের কাছেই থাক। ভালো লাগার কিছু মুহুর্ত নিজের ভেতর জিউয়ে রাখতে আলাদা আনন্দ আছে। বিরহ বা মজার আনন্দ।’\r\n\r\nশুধু তাই নয়, রক্তে লেখা কার্ডে প্রেমের প্রস্তাব পাওয়ার পর ওই যুবকের সঙ্গে কোনো সম্পর্ক তৈরি হয়েছিল কি না, সে সম্পর্কেও কিছু খোলাসা করেননি পরীমনি। হয়তো আবার কোনও এক ভালোবাসার দিনে অজানা সেই কথা জানাবেন। সেই অপেক্ষায় নায়িকার ভক্তরা।', '1613191528_4_5121.jpg', '1', '1', '2021-02-13 04:45:28', NULL, NULL),
(37, 7, 3, 'সবচেয়ে বড় সাইবার আক্রমণ', 'ফাঁস হয়ে গেছে নেট দুনিয়ার কোটি কোটি গ্রাহকের তথ্য। বলা হচ্ছে, বিশ্বের সবচেয়ে বড় সাইবার আক্রমণ হয়েছে। যার ফলে জিমেইল এবং হটমেইল মিলিয়ে প্রায় ৩২৭ কোটি ব্যবহারকারীর ব্যক্তিগত তথ্য চলে গেছে হ্যাকারদের হাতে।\r\n\r\nযেহেতু মেইলের সঙ্গে নেটফ্লিক্স ও বিটকয়েনসহ বিভিন্ন সোশ্যাল মিডিয়া সাইটের অ্যাকাউন্ট যুক্ত থাকে, তাই আশঙ্কা করা হচ্ছে, মেইলের পাসওয়ার্ড ব্যবহার করে সেই সমস্ত অ্যাকাউন্ট থেকেও তথ্য হাতানো হতে পারে। শুধু তাই নয়, ব্যাঙ্কের অ্যাকাউন্টের সঙ্গে জিমেইলের অ্যাকাউন্ট যুক্ত থাকে। ফলে ওই ৩২৭ কোটি ব্যবহারকারীর বহু গোপন নথি চুরি যাওয়ার সম্ভাবনা প্রবল।\r\n\r\nএর আগে ২০১৭ সালেও এই একই ধরনের সাইবার হামলার ঘটনা ঘটেছিল। সেবার হাতিয়ে নেওয়া হয়েছিল প্রায় ১৪০ কোটি ব্যবহারকারীর ব্যক্তিগত তথ্য।\r\n\r\nবিশেষজ্ঞদের বলছেন, হ্যাকারদের আক্রমণ থেকে বাঁচতে শীঘ্রই বদলে ফেলা উচিত পাসওয়ার্ড। বড়-ছোট অক্ষর, সিম্বল, নম্বরসহ আরও শক্তিশালী পাসওয়ার্ড ব্যবহার করার পরামর্শ দেওয়া হয়েছে', '1613191575_7_1818.jpg', '1', '1', '2021-02-13 04:46:15', NULL, NULL),
(38, 9, 1, 'পাকিস্তানের নৌ মহড়ায় অংশ নেবে ইরান', 'পাকিস্তানের বন্দরনগরী করাচির উপকূলে ইরানসহ ৪৫ দেশের অংশগ্রহণে আগামী ১১ থেকে ১৬ ফেব্রুয়ারি পর্যন্ত নৌ মহড়া অনুষ্ঠিত হবে।\r\n\r\n\r\nএবারের নৌ মহড়ার নাম দেওয়া হয়েছে আমান-২১। মহড়ায় ইরান পর্যবেক্ষক দেশ হিসেবে অংশ নেবে।খবর আরব নিউজের।\r\n\r\nপাকিস্তানি নৌবাহিনী জানিয়েছে, ৪৫ দেশের মধ্যে কয়টি দেশ তাদের যুদ্ধজাহাজসহ যোগ দেবে; আবার কয়েকটি দেশ শুধু প্রতিনিধিদল পাঠাবে।', '1613191603_9_6056.jpg', '0', '1', '2021-02-13 04:46:43', NULL, NULL),
(39, 5, 1, 'ঢাকায় সবকিছু বদলায়, বাস কেন নয়', 'ঢাকায় চলা বেশির ভাগ বাস-মিনিবাস বাইরে থেকে দেখতে রংচটা ও লক্কড়ঝক্কড়। পেছনের লাইট-ইন্ডিকেটর নেই। ভেতরে আসনের তেল চিটচিটে আচ্ছাদনে যে কারও গা গুলিয়ে আসবে। দাঁড়িয়ে যেতে হয় গাদাগাদি করে। গরমে ঘামে ভিজতে হয়। বর্ষায় বৃষ্টি ও শীতে ঠান্ডার বিড়ম্বনা। রাষ্ট্রীয় পরিবহন সংস্থা বিআরটিসির বাসের দশাও এমন।\r\n\r\nবাংলাদেশ সড়ক পরিবহন কর্তৃপক্ষের (বিআরটিএ) হিসাবে, বর্তমানে ঢাকা ও এর আশপাশে প্রায় ৮ হাজার বাস-মিনিবাস চলার অনুমতি আছে। তবে পরিবহন সূত্রগুলো বলছে, এই সংখ্যা বাড়ে-কমে। অনেক কোম্পানি অনুমোদনের চেয়ে বেশি বাস চালায়। আবার অনেক কোম্পানি অনুমোদন নিয়ে বাস নামায়নি।\r\n\r\n২০০৯ সালে জাপানের আন্তর্জাতিক সহায়তা সংস্থা জাইকার করা সমীক্ষা অনুসারে, ঢাকায় দিনে ৫৮ লাখ বারের বেশি যাতায়াত হয় বাস-মিনিবাসে, যা যান্ত্রিক যানবাহনে যাতায়াতের ৬৭ দশমিক ৪০ শতাংশ। মিরপুর-গুলিস্তান, উত্তরা-মতিঝিল, গাবতলী-যাত্রাবাড়ীর পথগুলোতে প্রচুর যাত্রী আছে। ভাড়াও নির্ধারিত হারের কয়েক গুণ। তবু ঢাকার বাসের এই করুণ দশা কেন?', '1613191671_5_1593.jpg', '1', '1', '2021-02-13 04:47:51', NULL, NULL),
(40, 10, 1, 'পর্যটকদের কাছে এখন জনপ্রিয় যে ৬টি স্পট', 'দেশে সম্প্রতি বেশ কয়েকটি নতুন স্পট পর্যটকদের কাছে জনপ্রিয় হয়ে উঠেছে। এসব জায়গায় আগে মানুষের যাতায়াত থাকলেও শুধুমাত্র ভ্রমণের উদ্দেশ্যে মানুষের তেমন যাতায়াত ছিল না। কিন্তু কিছুদিন ধরে পর্যটকদের কাছে আগ্রহের কেন্দ্র হয়ে উঠেছে এসব স্থান।১. মাওয়া ঘাট:২. নিকলি হাওর৩. বরিশালের শাপলা বিল৪. মৈনট ঘাট৫. চাঁদপুর ও চাঁদপুরের চর', '1613191672_10_9530.jpg', '1', '1', '2021-02-13 04:47:52', NULL, NULL),
(41, 6, 2, 'প্রোগ্রামিং করে কোটিপতি', 'আপরি কি কোটিপতি হতে চান??? তাহলে আজই শিখে ফেলুন প্রোগ্রামিং', '1613191690_6_6523.jpg', '1', '1', '2021-02-13 04:48:10', NULL, NULL),
(42, 14, 1, 'Food', 'Italian Pasta Salad', '1613191748_14_2383.jpg', '1', '1', '2021-02-13 04:49:08', NULL, NULL),
(43, 13, 1, '', '', '1613191751_13_2277.jpg', '1', '1', '2021-02-13 04:49:11', NULL, NULL),
(45, 14, 1, 'Food', 'crispy-garlic-roasted-potatoes', '1613191796_14_4566.jpg', '1', '1', '2021-02-13 04:49:56', NULL, NULL),
(55, 14, 1, 'Food', 'Dum Murg Ki Kacchi Biryani', '1613192027_14_7292.jpg', '1', '1', '2021-02-13 04:53:47', NULL, NULL),
(56, 6, 1, 'আপনি কি সাজেক যেতে পারছেন না', 'আপনি কি সাজেক যেতে পারছেন না,, হতাশায় ভুগছেন, চিন্তার কোনো কারন নেই,,, এবার সাজেক যাবেন নিশ্চিতে ???? সাজেক যাওয়ার ফমুর্লা। ছবিটি দেখুন', '1613192094_6_2102.jpg', '1', '1', '2021-02-13 04:54:54', NULL, NULL),
(57, 2, 3, 'Mobile test', 'Test from mobile', '1613192298_2_7614.jpg', '1', '1', '2021-02-13 04:58:18', NULL, NULL),
(58, 15, 3, 'প্রেসক্লাবে বিএনপির বিক্ষোভ, জলকামান-পুলিশ মোতায়েন ', 'ঢাকা: বিএনপির প্রতিষ্ঠাতা ও সাবেক রাষ্ট্রপতি জিয়াউর রহমানের ‘বীর উত্তম’ খেতাব বাতিল করার সিদ্ধান্তের প্রতিবাদে বিক্ষোভ সমাবেশ করছে ঢাকা মহানগর উত্তর ও দক্ষিণ বিএনপি।  \r\n\r\nশনিবার (১৩ ফেব্রুয়ারি) সকাল ১০টার দিকে রাজধানীর জাতীয় প্রেসক্লাবের সামনে এ সমাবেশ শুরু হয়।', '1613192627_15_5837.jpg', '0', '1', '2021-02-13 05:03:47', NULL, NULL),
(59, 11, 1, 'তেল-গ্যাস উৎপাদনকারী দেশের ৪০ শতাংশ রাজস্ব কমাবে সবুজ জ্বালানি', 'জীবাশ্ম জ্বালানির থেকে সরে এসে নবায়নযোগ্য ‘সবুজ’ জ্বালানির দিকে ঝুঁকলে অনেক তেল–গ্যাস উৎপাদনকারী দেশ বড় আকারের রাজস্ব আয় হারাবে। সম্প্রতি লন্ডনভিত্তিক গবেষণা সংস্থা কার্বন ট্রাকারের এক প্রতিবেদনে বলা হয়, শক্তি ব্যবহারের এই স্থানান্তর হলে তেল–গ্যাস উৎপাদনকারী অনেক দেশ ৪০ শতাংশ পর্যন্ত আয় হারাবে। \r\n\r\nহিসাব করে দেখা যায়, ২০৪০ সাল নাগাদ তেল উৎপাদনকারী দেশগুলো যে রাজস্ব হারাবে, এর পরিমাণ ১৩ ট্রিলিয়ন ডলার। এ অবস্থায় এসব দেশকে তাদের কৌশল পাল্টাতে হবে বলে মনে করে কার্বন ট্রাকার। বিবিসি অনলাইনের এক প্রতিবেদনে এ তথ্য জানানো হয়।\r\n\r\nপ্রতিবেদনে বলা হয়, ২০৪০ সাল পর্যন্ত তেলের চাহিদা থাকবে, এমনটা যেসব তেল উৎপাদনকারী দেশ ভাবছে, তাদের জন্য এটি একটি সংকেত। সংস্থাটি সতর্ক করে বলছে যে জলবায়ু লক্ষ্যমাত্রা অর্জনের কারণে চাহিদা কমে যেতে পারে। তেলের উৎপাদনকারীরা যা প্রত্যাশা করছেন, তার চেয়েও তেলের দাম কম হবে। বিশ্বব্যাপী তাপমাত্রা বৃদ্ধি ১ দশমিক ৬৫ সেন্টিগ্রেডে সীমাবদ্ধ থাকলে দেশগুলোর রাজস্বের কী হবে, তা প্রতিবেদনে দেখানো হয়েছে।\r\nবিজ্ঞাপন\r\n\r\nসরকারি আয় তেল ও প্রাকৃতিক গ্যাস রপ্তানির ওপর গভীরভাবে নির্ভরশীল দেশগুলোকে পেট্রোস্টেট বলা হয়। প্রতিবেদনের মূল লক্ষ্য, এমন ৪০টি পেট্রোস্টেট যে চ্যালেঞ্জের মুখে পড়বে, তা তুলে ধরা। এই দেশগুলোর তেল ও গ্যাসের দাম কমায় রাজস্বের গড় ক্ষতি হবে ৪৬ শতাংশ।\r\n\r\nকিছু দেশের অর্থনীতি পুরোপুরি তেল ও গ্যাসনির্ভর। ইরাকের রাজস্বের ৮০ শতাংশই আসে তেল থেকে। সৌদি আবরের ৬০ শতাংশ। প্রতিবেদনে বলা হয়, কিছু দেশ রাজস্ব আয়ের ক্ষেত্রে খুব বড় ক্ষতির মুখে পড়বে। অ্যাঙ্গোলা, আজারবাইজানসহ সাতটি দেশের জন্য ক্ষয়ক্ষতির পরিমাণ কমপক্ষে ৪০ শতাংশ হতে পারে। সৌদি আরব, নাইজেরিয়া, আলজেরিয়াসহ আরও ১২ দেশের ক্ষেত্রে এই ক্ষতির পরিমাণ হতে পারে ২০ থেকে ৪০ শতাংশ পর্যন্ত।', '1613193014_11_6283.jpg', '1', '1', '2021-02-13 05:10:14', NULL, NULL),
(60, 2, 2, 'imagetest', 'imagetest', '1613197596_2_8341.jpg', '1', '1', '2021-02-13 06:26:37', NULL, NULL),
(61, 17, 3, 'উসকানি দেওয়ার অভিযোগ ‘ভয়ংকর মিথ্যা’: ট্রাম্পের আইনজীবী', 'afasfsfsffasdfsdfsfsdffs', '1613198720_17_1396.jpg', '1', '1', '2021-02-13 06:45:20', NULL, NULL),
(62, 2, 6, 'Valentines Day Class', 'হলঘরের সামনের দিকে মানুষের গুঞ্জন, ফিসফিসানি আর শ্বাসপ্রশ্বাসের শব্দ। মনটা খারাপ থাকলে নিজের অস্তিত্ব অনুভব করাটা খুব জরুরি হয়ে পড়ে। তাই পেছনে গিয়ে একাকী বসে আছি। দুপাশের চেয়ারগুলো বেশির ভাগই ফাঁকা। বিজয় দিবসের কোনো অনুষ্ঠান আমি পারতপক্ষে বাদ দিই না। কিন্তু উপজেলা সদরের অনুষ্ঠানগুলোতে স্থানীয় রাজনীতিবিদেরা আসেন। তাদের রাজনৈতিক ভাঁওতাবাজির গলাবাজি আর ফোলানো-ফাঁপানো কথাবার্তা বলেন, আমার ভালো লাগে না। সে তুলনায় শহরের এক প্রান্তে আমার বাড়ির কাছের এই অনুষ্ঠানে আসতেই ভালো লাগে। মিলনায়তনে জৌলুশ নেই। নেই ভাড়াটে নামী শিল্পীও। এলাকার শখের শিল্পীরাই আবৃত্তি, গান, নাচ করে। তবু অনুষ্ঠানজুড়েই থাকে পরম আন্তরিকতা আর মমতার ছোঁয়া।\r\n\r\nএকদল তরুণের দলগত আবৃত্তি দিয়ে সেদিন অনুষ্ঠান শুরু হলো। তারপর এল কখনো শিশু-কিশোর, কখনো বড়দের নাচ-গান-আবৃত্তি। একসময় উপস্থাপক ধন্যবাদ জানিয়ে অনুষ্ঠানের সমাপ্তি টানল। অনুষ্ঠান শেষ হতেই দর্শক হুড়মুড় করে বের হতে শুরু করল। হাতঘড়ির দিকে তাকিয়ে দেখলাম, রাত নয়টা চল্লিশ।', '1613275849_2_7297.jpg', '1', '1', '2021-02-14 04:10:50', NULL, NULL),
(63, 5, 12, '', '', '', '1', '1', '2021-02-14 04:41:22', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` set('0','1','2','') COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` set('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `token`, `status`, `role`, `created`, `updated`, `deleted`) VALUES
(2, 'mamun', 'mamun@gmail.com', '$2y$10$WZXHbkIb0yjcDZt18As4suwGVKg93mAkoMNtZTEm67ak5RxczBNQC', NULL, '1', '1', '2021-02-11 05:57:29', '2021-02-11 05:57:29', NULL),
(3, 'KAZI EMAM', 'email@gmail.com', '$2y$10$.Eokj.E6O1FIq66vM6G/4evrarCPhtH23oQSL2HIrlk5uaRokU.UG', NULL, '1', '1', '2021-02-13 03:52:07', '2021-02-13 03:52:07', NULL),
(4, 'ABD mannaf', 'manaf@gmail.com', '$2y$10$QBk7YhXarEW33JLGBxkQa.ZBi9MIH219p9AE1mVe7lADOOfti1qvq', NULL, '1', '1', '2021-02-13 04:35:07', '2021-02-13 04:35:07', NULL),
(5, 'Mehedi', 'mehedihasan952867@gmail.com', '$2y$10$0ZSwxu47F9ggcQzBGvBGE.fR31MD7xRk6jy43wnuQmLVwIV8rHfim', NULL, '1', '1', '2021-02-13 04:35:13', '2021-02-13 04:35:13', NULL),
(6, 'anonymous', 'anonymous@gmail.com', '$2y$10$zES/4OrK9xTUbcrc.878nOHzRwzFM6Duj5b29IXpfhgAuAocvGCla', NULL, '1', '1', '2021-02-13 04:35:47', '2021-02-13 04:35:47', NULL),
(7, 'Adnan', 'azarnob@gmail.com', '$2y$10$uMd2PYB0VPKsgxQAo5jmOODjho0LHlmNsDLB1R.drEeGGSxV7HIKm', NULL, '1', '1', '2021-02-13 04:35:54', '2021-02-13 04:35:54', NULL),
(8, 'A', 'aj@gmail.com', '$2y$10$HUFaXG8LB8sbcBj7h1fgOuS4bjePi7aRRu31xUAE55fCaaGCCQjWu', NULL, '1', '1', '2021-02-13 04:36:04', '2021-02-13 04:36:04', NULL),
(9, 'mujammel hoque', 'mujammelh@gmail.com', '$2y$10$d1r/Hurv/nK4OTZcmEeBUu8LOhAI6SZ5Rrl8UkmzUUgNL/AFc8ILu', NULL, '1', '1', '2021-02-13 04:36:25', '2021-02-13 04:36:25', NULL),
(10, 'Ashraful', 'aikobirbd@gmail.com', '$2y$10$X1V9cmsHzZNaWpld.sqYhuhfL.GbCCcnKDPuz3WuN7XEb9l/2XePS', NULL, '1', '1', '2021-02-13 04:36:26', '2021-02-13 04:36:26', NULL),
(11, 'Milan', 'asaphmilaan@gmail.com', '$2y$10$YW4y3CuthdvQ6zXecSz73ul.6BvB7E2nJ8av3JLA.rSCqGtRKkLbi', NULL, '1', '1', '2021-02-13 04:36:41', '2021-02-13 04:36:41', NULL),
(12, 'Sharmin', 'sharminmeena24h@gmail.com', '$2y$10$T2tXi3pSirAs/J2yC4Qeq.HeB/LFOAWtfjc1lkur/UB1xYtj0ZA4S', NULL, '1', '1', '2021-02-13 04:36:51', '2021-02-13 04:36:51', NULL),
(13, 'ayesha', 'ayesha@gmail.com', '$2y$10$ZNm3mePTuxzLBof8gxAuiehFFHm6rbW4D3UfZwyJwAeX/Y4yf1c06', NULL, '1', '1', '2021-02-13 04:39:56', '2021-02-13 04:39:56', NULL),
(14, 'Tamanna', 'tamanna@gmail.com', '$2y$10$iNeORGh5JQxyFbAP0/zdEek7Ty0Ie/x8t6oOlFMgWtw4.lShvpJeS', NULL, '1', '1', '2021-02-13 04:42:28', '2021-02-13 04:42:28', NULL),
(15, 'Rabeya', 'rabeya@gmail.com', '$2y$10$qb0.HDackX2PHDas8W8Viu2XqMBO900V9DudEJe2/p9rYvBOuryNu', NULL, '1', '1', '2021-02-13 04:45:24', '2021-02-13 04:45:24', NULL),
(17, 'dev', 'dev@gmail.com', '$2y$10$kj27sgrd42AcvCrYqszMlesF.wPZJRstD54PTvJEO496CBdMegYiC', NULL, '1', '1', '2021-02-13 05:42:29', '2021-02-13 05:42:29', NULL),
(18, 'mujammel', 'mujammel@gmail.com', '$2y$10$.FWfnTQbQ82em5q.6GVegekmGsFeyq73Dky/ADjjkRr2nO49y0xwO', NULL, '1', '1', '2021-02-14 04:49:04', '2021-02-14 04:49:04', NULL),
(20, 'sumi', 'sumi@gmail.com', '$2y$10$2YLfBCwTFNC.htvkiGxdZ.UXIKjT3sxk1YPKH9soUkj724Y2g/ATG', NULL, '1', '1', '2021-02-14 05:51:49', '2021-02-14 05:51:49', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tid` (`tid`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uid` (`uid`);

--
-- Indexes for table `reacts`
--
ALTER TABLE `reacts`
  ADD PRIMARY KEY (`uid`,`tid`),
  ADD KEY `tid` (`tid`);

--
-- Indexes for table `tweets`
--
ALTER TABLE `tweets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `cid` (`cid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tweets`
--
ALTER TABLE `tweets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `tweets` (`id`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `users` (`id`);

--
-- Constraints for table `profiles`
--
ALTER TABLE `profiles`
  ADD CONSTRAINT `profiles_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`id`);

--
-- Constraints for table `reacts`
--
ALTER TABLE `reacts`
  ADD CONSTRAINT `reacts_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `reacts_ibfk_2` FOREIGN KEY (`tid`) REFERENCES `tweets` (`id`);

--
-- Constraints for table `tweets`
--
ALTER TABLE `tweets`
  ADD CONSTRAINT `tweets_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `tweets_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
