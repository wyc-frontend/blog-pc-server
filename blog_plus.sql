-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2023-01-31 13:09:05
-- 服务器版本： 5.6.50-log
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog_plus`
--

-- --------------------------------------------------------

--
-- 表的结构 `article_classify_table`
--

CREATE TABLE IF NOT EXISTS `article_classify_table` (
  `cid` int(11) NOT NULL,
  `cname` varchar(45) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `article_classify_table`
--

INSERT INTO `article_classify_table` (`cid`, `cname`) VALUES
(2, 'JavaScript'),
(5, 'Vue'),
(6, 'Axios'),
(7, '测试'),
(8, 'Express');

-- --------------------------------------------------------

--
-- 表的结构 `article_table`
--

CREATE TABLE IF NOT EXISTS `article_table` (
  `id` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `time` varchar(45) DEFAULT NULL,
  `html` longtext,
  `description` varchar(128) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `cname` varchar(45) DEFAULT NULL,
  `text` longtext
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='博客文章表';

--
-- 转存表中的数据 `article_table`
--

INSERT INTO `article_table` (`id`, `username`, `time`, `html`, `description`, `title`, `cname`, `text`) VALUES
(17, 'qqq', '2023/1/27-21:26:04', '<h3 data-v-md-heading="测试" data-v-md-line="1">测试</h3>\n<p data-v-md-line="2">内容内容内容内容4567890</p>\n', '测试描述', '测试标题', '测试', '### 测试\n内容内容内容内容4567890'),
(18, 'qqq', '2023/1/27-21:43:27', '<h3 data-v-md-heading="es6-原型及原型链" data-v-md-line="1">ES6–原型及原型链</h3>\n<h4 data-v-md-heading="_1、构造函数和原型prototype" data-v-md-line="2">1、构造函数和原型prototype</h4>\n<p data-v-md-line="3">（1）原型prototype：每个构造函数都有一个prototype属性，指向一个对象。prototype的本质也是一个JavaScript对象，称为原型对象，这个对象的所有属性和方法都会被构造函数所拥有。因此，可将共用的一些方法直接定义在prototype上，这样所有对象实例就可以共享这些方法；<br>\n（2)作用：原型prototype的作用是共享方法、节约内存；</p>\n<div data-v-md-line="5"><div class="v-md-pre-wrapper v-md-pre-wrapper-javascript extra-class"><pre class="v-md-prism-javascript"><code><span class="token comment">// 1、构造函数</span>\n    <span class="token keyword">function</span> <span class="token function">Star</span><span class="token punctuation">(</span><span class="token parameter">uname<span class="token punctuation">,</span> age</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>\n        <span class="token keyword">this</span><span class="token punctuation">.</span>uname <span class="token operator">=</span> uname<span class="token punctuation">;</span>\n        <span class="token keyword">this</span><span class="token punctuation">.</span>age <span class="token operator">=</span> age<span class="token punctuation">;</span>\n    <span class="token punctuation">}</span>\n    <span class="token comment">// 通过原型 prototype 添加共有的方法</span>\n    <span class="token class-name">Star</span><span class="token punctuation">.</span>prototype<span class="token punctuation">.</span><span class="token function-variable function">sing</span> <span class="token operator">=</span> <span class="token keyword">function</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>\n        console<span class="token punctuation">.</span><span class="token function">log</span><span class="token punctuation">(</span><span class="token string">"I can sing songs"</span><span class="token punctuation">)</span><span class="token punctuation">;</span>\n    <span class="token punctuation">}</span>\n    <span class="token comment">// 所有对象实例都可以使用 prototype 里面的共享方法</span>\n    <span class="token keyword">var</span> zhangsan <span class="token operator">=</span> <span class="token keyword">new</span> <span class="token class-name">Star</span><span class="token punctuation">(</span><span class="token string">"zhangsan"</span><span class="token punctuation">,</span> <span class="token number">18</span><span class="token punctuation">)</span><span class="token punctuation">;</span>\n    <span class="token keyword">var</span> lisi <span class="token operator">=</span> <span class="token keyword">new</span> <span class="token class-name">Star</span><span class="token punctuation">(</span><span class="token string">"lisi"</span><span class="token punctuation">,</span> <span class="token number">20</span><span class="token punctuation">)</span><span class="token punctuation">;</span>\n    zhangsan<span class="token punctuation">.</span><span class="token function">sing</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">;</span> <span class="token comment">//输出 I can sing songs</span>\n    lisi<span class="token punctuation">.</span><span class="token function">sing</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">;</span> <span class="token comment">//输出 I can sing songs</span>\n</code></pre>\n</div></div><h4 data-v-md-heading="_2、对象原型-proto" data-v-md-line="21">2、对象原型 __ proto __</h4>\n<p data-v-md-line="22">对象自身的一种属性，它指向原型对象prototype，创建的对象实例里面有__ proto __，它指向构造函数的prototype，因此可以使用prototype里面的方法。</p>\n<h4 data-v-md-heading="_3、constructor属性" data-v-md-line="23">3、constructor属性</h4>\n<p data-v-md-line="24">原型对象prototype和对象原型 __ proto __里面都有一个constructor属性，constructor可以指回构造函数本身。</p>\n<h4 data-v-md-heading="_4、成员查找机制" data-v-md-line="25">4、成员查找机制</h4>\n<p data-v-md-line="26">根据原型链一层与层往上找：<br>\n实例对象→→→构造函数原型对象→→→Object原型对象</p>\n', '关于原型和原型链的概述', 'es6原型和原型链', 'JavaScript', '### ES6--原型及原型链\n#### 1、构造函数和原型prototype\n（1）原型prototype：每个构造函数都有一个prototype属性，指向一个对象。prototype的本质也是一个JavaScript对象，称为原型对象，这个对象的所有属性和方法都会被构造函数所拥有。因此，可将共用的一些方法直接定义在prototype上，这样所有对象实例就可以共享这些方法；\n（2)作用：原型prototype的作用是共享方法、节约内存；\n```javascript\n// 1、构造函数\n    function Star(uname, age) {\n        this.uname = uname;\n        this.age = age;\n    }\n    // 通过原型 prototype 添加共有的方法\n    Star.prototype.sing = function () {\n        console.log("I can sing songs");\n    }\n    // 所有对象实例都可以使用 prototype 里面的共享方法\n    var zhangsan = new Star("zhangsan", 18);\n    var lisi = new Star("lisi", 20);\n    zhangsan.sing(); //输出 I can sing songs\n    lisi.sing(); //输出 I can sing songs\n```\n#### 2、对象原型 __ proto __\n对象自身的一种属性，它指向原型对象prototype，创建的对象实例里面有__ proto __，它指向构造函数的prototype，因此可以使用prototype里面的方法。\n#### 3、constructor属性\n原型对象prototype和对象原型 __ proto __里面都有一个constructor属性，constructor可以指回构造函数本身。\n#### 4、成员查找机制\n根据原型链一层与层往上找：\n实例对象→→→构造函数原型对象→→→Object原型对象');

-- --------------------------------------------------------

--
-- 表的结构 `messageboard`
--

CREATE TABLE IF NOT EXISTS `messageboard` (
  `id` int(11) NOT NULL,
  `uname` varchar(45) NOT NULL,
  `msg` varchar(255) NOT NULL,
  `time` varchar(45) DEFAULT NULL,
  `iptsts` tinyint(4) DEFAULT '0',
  `img` varchar(128) DEFAULT NULL,
  `replysts` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `messageboard`
--

INSERT INTO `messageboard` (`id`, `uname`, `msg`, `time`, `iptsts`, `img`, `replysts`) VALUES
(37, 'qwe', '站长的开发能力毋庸置疑~', '2023/1/27-22:34:26', 0, 'http://139.9.92.52:9000/public/images/img-1672779433797.jpeg', 0),
(38, 'zyj', '二傻子', '2023/1/27-下午10:53:17', 0, 'http://139.9.92.52:9000/public/images/img-1674830434624.jpeg', 0);

-- --------------------------------------------------------

--
-- 表的结构 `reply_table`
--

CREATE TABLE IF NOT EXISTS `reply_table` (
  `id` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `img` varchar(128) DEFAULT NULL,
  `time` varchar(45) DEFAULT NULL,
  `msg` varchar(255) DEFAULT NULL,
  `fid` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='回复功能表';

--
-- 转存表中的数据 `reply_table`
--

INSERT INTO `reply_table` (`id`, `username`, `img`, `time`, `msg`, `fid`) VALUES
(14, 'qqq', 'http://127.0.0.1/public/images/img-1672787946384.jpeg', '2023/1/11-17:17:23', '测试回复功能', 14),
(16, 'aaa', 'http://127.0.0.1/public/images/img-1674105358750.jpeg', '2023/1/19-18:25:52', '你好', 14);

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(255) NOT NULL,
  `userpic` varchar(255) DEFAULT NULL,
  `token` longtext
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `userpic`, `token`) VALUES
(66, 'test1', '$2a$10$a2aTcjfmGgacWyCyQ/nHHOeDzXEc0bEFKFEi/fRxfIrrwYXO2m5hm', '/public/images/img-1672409839318.jpeg', NULL),
(68, 'qwe', '$2a$10$G8PMZNRaUvpb.V1tgTphEu1tqxovQvYLhe26sm7/BIbIsnuEBvdNS', '/public/images/img-1672779433797.jpeg', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NjgsInVzZXJuYW1lIjoicXdlIiwicGFzc3dvcmQiOiIkMmEkMTAkRzhQTVpOUmFVdnBiLlYxdGdUcGhFdTF0cXhvdlF2WUxoZTI2c203L0JJYklzbnVFQnZkTlMiLCJ1c2VycGljIjoiL3B1YmxpYy9pbWFnZXMvaW1nLTE2NzI3Nzk0MzM3OTcuanBlZyIsInRva2VuIjoiZXlKaGJHY2lPaUpJVXpJMU5pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SnBaQ0k2Tmpnc0luVnpaWEp1WVcxbElqb2ljWGRsSWl3aWNHRnpjM2R2Y21RaU9pSWtNbUVrTVRBa1J6aFFUVnBPVW1GVmRuQmlMbFl4ZEdkVWNHaEZkVEYwY1hodmRsRjJXVXhvWlRJMmMyMDNMMEpKWWtsemJuVkZRblprVGxNaUxDSjFjMlZ5Y0dsaklqb2lMM0IxWW14cFl5OXBiV0ZuWlhNdmFXMW5MVEUyTnpJM056azBNek0zT1RjdWFuQmxaeUlzSW5SdmEyVnVJam9pWlhsS2FHSkhZMmxQYVVwSlZYcEpNVTVwU1hOSmJsSTFZME5KTmtscmNGaFdRMG81TG1WNVNuQmFRMGsyVG1wbmMwbHVWbnBhV0VwMVdWY3hiRWxxYjJsaldHUnNTV2wzYVdOSFJucGpNMlIyWTIxUmFVOXBTV3ROYlVWclRWUkJhMUo2YUZGVVZuQlBWVzFHVm1SdVFtbE1iRmw0WkVka1ZXTkhhRVprVkVZd1kxaG9kbVJzUmpKWFZYaHZXbFJKTW1NeU1ETk1NRXBLV1d0c2VtSnVWa1pSYmxwclZHeE5hVXhEU2pGak1sWjVZMGRzYWtscWIybE1NMEl4V1cxNGNGbDVPWEJpVjBadVdsaE5kbUZYTVc1TVZFVXlUbnBKTTA1NmF6Qk5lazB6VDFSamRXRnVRbXhhZVVselNXNVNkbUV5Vm5WSmFtOXBXbGhzUzJGSFNraFpNbXhRWVZWd1NsWlljRXBOVlRWd1UxaE9TbUpzU1RGWk1FNUtUbXRzY21OR2FGZFJNRzgxVEcxV05WTnVRbUZSTUdzeVZHMXdibU13YkhWV2JuQmhWMFZ3TVZkV1kzaGlSV3h4WWpKc2FsZEhVbk5UVjJ3ellWZE9TRkp1Y0dwTk1sSXlXVEl4VW1GVk9YQlRWM1JPWWxWV2NsUldVa0poTVVvMllVWkdWVlp1UWxCV1Z6RkhWbTFTZFZGdGJFMWlSbXcwV2tWa2ExWlhUa2hoUlZwclZrVlpkMWt4YUc5a2JWSnpVbXBLV0ZaWWFIWlhiRkpLVFcxTmVVMUVUazFOUlhCTFYxZDBjMlZ0U25WV2ExcFNZbXh3Y2xaSGVFNWhWWGhFVTJwR2FrMXNXalZaTUdSellXdHNjV0l5YkUxTk1FbDRWMWN4TkdOR2JEVlBXRUpwVmpCYWRWZHNhRTVrYlVaWVRWYzFUVlpGVlhsVWJuQktUVEExTm1GNlFrNWxhekI2VkRGU2FtUlhSblZSYlhoaFpWVnNlbE5YTlZOa2JVVjVWbTVXU21GdE9YQlhiR2h6VXpKR1NGTnJhRnBOYlhoUldWWldkMU5zV2xsalJYQk9WbFJXZDFVeGFFOVRiVXB6VTFSR1drMUZOVXRVYlhSelkyMU9SMkZHWkZKTlJ6Z3hWRWN4VjA1V1RuVlJiVVpTVFVkemVWWkhNWGRpYlUxM1lraFdWMkp1UW1oV01GWjNUVlprVjFremFHbFNWM2g0V1dwS2MyRnNaRWhWYms1VVZqSjNlbGxXWkU5VFJrcDFZMGR3VGsxc1NYbFhWRWw0VlcxR1ZrOVlRbFJXTTFKUFdXeFdWMk5zVWxkVmEwcG9UVlZ2TWxsVldrZFdWbHAxVVd4Q1YxWjZSa2hXYlRGVFpGWkdkR0pGTVdsU2JYY3dWMnRXYTJFeFdsaFVhMmhvVWxad2NsWnJWbHBrTVd0NFlVYzVhMkpXU25wVmJYQkxWMFphV1dGSVdsaGlSa3BMVkZjeFRtVlZNVVZVYXpGT1VsaENURll4WkRCak1sWjBVMjVXVjJFeGNGTlpiWGgzWTJ4YVNHVkZOV2hXV0doRlZUSndSMkZyTVhOWGFsWmFUVWRTZWxsWGRITmpWMGw1WWtVeFRrMUZiRFJXTVdONFRrZE9SMkpFVmxCWFJVcHdWbXBDWVdSV1pITmhSVFZyWWxWYVdWUldZekZVVmxwR1ZsaHNWV0p1UWt0VVZFRXhUbTFHTmxGck5XeGhla0kyVmtSR1UyRnRVbGhTYmxaU1lsaG9hRnBXVm5ObGJFNVlUbFpPYTJKVlZqVldiVFZYVTIxR2RFOVlRbGhpUjJoNlZYcEtSMU5HVG5KaFJuQk9ZbGhvVWxkV1dsZGtNVTV6VjJ4c2FsSllRazlXYkZKWFpERlZlR0ZGT1ZSaVZYQjZWVEZTUjFkck1VWk9WWFJWWWxoU2Vsa3lNVTlTTWtaSFdrWktUbEo2WjNoV1JXTjRWakExVjFSdVZsSmlWVnBUVkZWa2VtVldXa2hOV0dScFlsVXhNMWxyYUZkV01rcDFVVzFvVjAxR1dqTlVWbHByVmpGcmVtRkhiRk5XTTJnMFYxZHdTMk15Um5OYVJXaFdZbXMxVlZacVNqTmxiR3hYV2tVNVZGSnJjREZaTUdSM1ZHc3hjMU5ZYkZoV1JXdzBWbGN4UjFack9WbFJiRkpYVFRGS1VGZFhlRmRXTWs1elZXeGtWbUV3Y0c5VVZsWjJUV3hzVmxkclpGZFdiSEF4VlZkNFExWXhXalpTYTJoWFlsUkdWRnBHV2tka1IwcEdUVmRzVTJKWVkzZFdNblJYWVRKRmVGZHNhRlZoTW1odlZXeGFkMk5zV25KV2JIQnJUVmQwTkZsVll6VmhNa3BYVTI1d1ZtSllRa3hXTUZwaFYxZEdTVmRzYUdsU2EzQk1Wa1pqZUZSdFZsWk5WVlpWWVhwR1QxVnNhRU5VUmxsNFdrUkNhazFzV2pCVk1qVlhWakpGZUdOR1RscGlXR2d6V1RKNFlWTkhWa1pPVjJoWFYwZG9SbFpVU25kU01rWnlUVmhPV0dGc1dtRlVWV1JUWld4c1dHUklUbXBXTUd3MVdXdFZlRlJyTVVaaVJGSlhUVmRPTkZSclpFOVNNa3BGVm14Q1dGSlZjSGRXYlhCRFdWZFNWMXBJVG1oU1ZGWnlXV3hXWVZkV1VsZFpla1pWVm14d1IxWnNhSE5XVjBwMVVXdDBWVlpGUlhoVWJURkhUbXhHY2s1WGVHaGxhMGt5Vm10U1IxVXlSblJWYkdoVFlteGFVMWxzYUc5aFJuQlhWbTVPYkdKRk5WbFViRnBQWVRKS1ZsWnFWbGRpVkZaWVZUSXhSMlJXUm5GU2JVWlRZbFpGZDFkWWNFTk9Sa3BIVkc1V1VtSklRbGxWYlhSaFpERmFSVk51WkZOaGVrWjVWR3hTWVZac1pFaGhSVGxoVm5wR1VGUnNXbE5qTVZaeVYyMXdUbEl6WjNkV2JURjNWVEpHYzFKWVpHaGxhM0JXVm0xNFMxbFdVbFZSVkVaVFZtdHdWbFpIY3pGaVIwVjVaRVJTVjFKc2NIVmFSRUkwWTJzNVdWZHJOVk5sYkVWM1ZsUktNR1JyTlZaUFZXeGhVa1ZhVDFsWGRFdFdiRmw1VFVSV1QxSnRPVE5hUlZwWFZqSktjazVZY0dGV00yaFVXVlphU21ReFVsVlZhemxvWWxobk1GWXhZekZpTVZwWFZWaGtVRlpZYUhKVmFrNXZWMnhzZEdWR1dtaFdXR2hGVlRJMVExZHNaRWRTYmtKVlRXNUNSMVJYY3pGT2JGWlpZa1pDVjFKdGRETldSM2hUVW0xTmQySklVbGRoYkVweFZWUkNjazFzVWxkVmJIQk9UVVJXUmxaR2FIZFViVVp6VWxob1ZWWnRaRE5VUjNoelpWVTVTVlpVVWs1V01rMTRWbTEwUzAxV1drbFJiRUpRVmxWd2RGWkdWazlqVms1SllrVmthVTFIYUZOVVdIQlRZMnQ0V1ZWdVpGcGhNbEp5V2tkNFRrMHhiSFJsUkVaVlZqQXhjRlJGVGt0alJteFpWVmRzVUdGclZYbFVibkJTVFVVNVJWa3phRTVTUjA1NlUxY3hWMDVIVGtSVFZGcE9Wa1pyZWxSclVsWmxWVEUyVWxoa1QwMTZRWFZXTTJSclRsVlNiRkpWY0VWbFZYUjZZMWhyZEZaRVFqTmthMXBxVjBkT1NHTnRlRlpQV0dzMVpXeHdhMkl3VWxwTmJUVnNWbFJTWVdSNVNYTkpiV3hvWkVOSk5rMVVXVE5PUkZWNVQxUkZNazVUZDJsYVdHaDNTV3B2ZUU1cVl6Qk9WRmt4VFZSWk1XWlJMa2hIVVRScVRqZEVibEpOZUdKdWVpMWZkbUpOUldOdk4zTm1abEIyZGpSUVJtOUxOSEJ5VkVKSFRUUWlMQ0pwWVhRaU9qRTJOelEyTVRnMU1qa3NJbVY0Y0NJNk1UWTNORFkxTkRVeU9YMC5mdFNGOUFGMjM5dzc4ZE1PNGVfTWNHLXVpd0hPUnRBaW5EeWhfdDBzbTBZIiwiaWF0IjoxNjc0ODI5ODcwLCJleHAiOjE2NzQ4NjU4NzB9.rV1huo-0-crwgG0ZxM50c5kSndsNRCD9ohQM0YHPUYM'),
(69, 'qqq', '$2a$10$y135jVlzLqfPRBnY/u5NPOoYYX3a99OOX9hgn07hRB5mlxQsmyYey', '/public/images/img-1672787946384.jpeg', NULL),
(73, 'ccc', '$2a$10$RbnRIClu8/mcuS3zoTnn7elB575X.Ah5CtVN5p1cnI2nTwq/8kIMi', '/public/images/img-1674129814078.jpeg', NULL),
(74, '测试账号01', '$2a$10$cLtsUSw5AF.DweetkaR0oOuT7bu2ujJ.4.0z2.hByW3A8.mI0.8Au', '/public/images/img-1674293496550.jpeg', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NzQsInVzZXJuYW1lIjoi5rWL6K-V6LSm5Y-3MDEiLCJwYXNzd29yZCI6IiQyYSQxMCRjTHRzVVN3NUFGLkR3ZWV0a2FSMG9PdVQ3YnUydWpKLjQuMHoyLmhCeVczQTgubUkwLjhBdSIsInVzZXJwaWMiOiIvcHVibGljL2ltYWdlcy9pbWctMTY3NDI5MzQ5NjU1MC5qcGVnIiwidG9rZW4iOm51bGwsImlhdCI6MTY3NDI5MzUwNywiZXhwIjoxNjc0MzI5NTA3fQ.RapkwmneUKHlDvwjOCRlVPtavF9gm4vFqCMWAfyKIDk'),
(75, 'zyj', '$2a$10$73jvcKYQXlODoVog9J/st.1pQQobWacsnBzmQDV9I.BIPYJoK1GQS', '/public/images/img-1674830434624.jpeg', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NzUsInVzZXJuYW1lIjoienlqIiwicGFzc3dvcmQiOiIkMmEkMTAkNzNqdmNLWVFYbE9Eb1ZvZzlKL3N0LjFwUVFvYldhY3NuQnptUURWOUkuQklQWUpvSzFHUVMiLCJ1c2VycGljIjoiL3B1YmxpYy9pbWFnZXMvaW1nLTE2NzQ4MzA0MzQ2MjQuanBlZyIsInRva2VuIjoiZXlKaGJHY2lPaUpJVXpJMU5pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SnBaQ0k2TnpVc0luVnpaWEp1WVcxbElqb2llbmxxSWl3aWNHRnpjM2R2Y21RaU9pSWtNbUVrTVRBa056TnFkbU5MV1ZGWWJFOUViMVp2WnpsS0wzTjBMakZ3VVZGdllsZGhZM051UW5wdFVVUldPVWt1UWtsUVdVcHZTekZIVVZNaUxDSjFjMlZ5Y0dsaklqb2lMM0IxWW14cFl5OXBiV0ZuWlhNdmFXMW5MVEUyTnpRNE16QTBNelEyTWpRdWFuQmxaeUlzSW5SdmEyVnVJam9pWlhsS2FHSkhZMmxQYVVwSlZYcEpNVTVwU1hOSmJsSTFZME5KTmtscmNGaFdRMG81TG1WNVNuQmFRMGsyVG5wVmMwbHVWbnBhV0VwMVdWY3hiRWxxYjJsbGJteHhTV2wzYVdOSFJucGpNMlIyWTIxUmFVOXBTV3ROYlVWclRWUkJhMk5WUmtOTU1taHdZVWh3TTAweVNtNWllbHBQV25rMU5sTnNWa2xhVlhoT1QwWk9WMXA1T1hsaFZHeEZZbTFOTW1KNlFuZFdWM1JhVVRCV1VsUXlWWGhqYXpsMFZWTTBhVXhEU2pGak1sWjVZMGRzYWtscWIybE1NMEl4V1cxNGNGbDVPWEJpVjBadVdsaE5kbUZYTVc1TVZFVXlUbnBSTkUxNlFUQk5lbEV5VFdwUmRXRnVRbXhhZVVselNXNVNkbUV5Vm5WSmFtOXBXbGhzUzJGSFNraFpNbXhRWVZWd1NsWlljRXBOVlRWd1UxaE9TbUpzU1RGWk1FNUtUbXRzY21OR2FGZFJNRzgxVEcxV05WTnVRbUZSTUdzeVZHNXdWbU13YkhWV2JuQmhWMFZ3TVZkV1kzaGlSV3h4WWpKc2JHSnRlSGhUVjJ3ellWZE9TRkp1Y0dwTk1sSXlXVEl4VW1GVk9YQlRWM1JPWWxWV2NsUldVa0poTWtaRlZteENWbEl6YURaYVZsVTFaVmRGZUZSWVZteFNiV2g0V1RCV2QxWXdOWEpXYWxKclZYcHNTMVV5ZEdGbFJsSlVUMVZ3WVdKRk5YQlhiWGh2WlZaT2MxTnJaRmRXTURWWFdrUk9XbVJzVmpaUmFsSk9VbFJXWVZacVRrWmhWWGhFVTJwR2FrMXNXalZaTUdSellXdHNjV0l5YkUxTk1FbDRWMWN4TkdOR2JEVlBXRUpwVmpCYWRWZHNhRTVrYlVaWVRWYzFUVlpGVlhsVWJuQlNUa1V4TmxGVVFrNWxiRVY1VkZkd1VtUlhSblZSYlhoaFpWVnNlbE5YTlZOa2JVVjVWbTVXU21GdVFqRmFSbVEwWXpCNFJGTnVRbHBYUmtad1ZESndSazFyTlRaVlZGSk9aV3RGZDFSclVscGpNR3gwVm1wU2FsRXdhekpVVmxKYVRUQTFSVnA2U2s5aGJFVjNWRzAwZDB4cVVuRmpTR2hvVTFkU2FVOVVXbmxQV0ZwVFdUQjBhR0o2VGtkaFZHTXpWVEpaTVZWR1pERmlSRTVXV2xSc1RHUklVa1pQUms1dVpXMXphVXhEU25CWldGRnBUMnBGTWs1NlVUUk5la0V3VDBSTmMwbHRWalJqUTBrMlRWUlpNMDVFWnpKT2FsRTBUVE13TGtaWGNWOTJiWEJ4VkhCUGMzQkxaRkp1ZVZGVldIRlZZbk5uWVZCTFRWaDJOMGw1ZGw4M2VHWktVbEVpTENKcFlYUWlPakUyTnpRNE16RTFPRE1zSW1WNGNDSTZNVFkzTkRnMk56VTRNMzAuaWlhZ0pmWFNvdnRsdUlOU0U3ZTUxTUFPWVRuVWJxNEJJdXJib2hYRTNsOCIsImlhdCI6MTY3NDg3MjMyNSwiZXhwIjoxNjc0OTA4MzI1fQ.o-ZGTJK-7bG75f-ZHYZ6GxmGz-WTO52rlTt5nPoc5mw'),
(76, 'wyc', '$2a$10$dUMyDVOIWq3yZaaJZQfUuuWuF8mQZrUhfAmNwnTVTfVePufuMy55a', '/public/images/img-1674830951188.jpeg', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NzYsInVzZXJuYW1lIjoid3ljIiwicGFzc3dvcmQiOiIkMmEkMTAkZFVNeURWT0lXcTN5WmFhSlpRZlV1dVd1RjhtUVpyVWhmQW1Od25UVlRmVmVQdWZ1TXk1NWEiLCJ1c2VycGljIjoiL3B1YmxpYy9pbWFnZXMvaW1nLTE2NzQ4MzA5NTExODguanBlZyIsInRva2VuIjpudWxsLCJpYXQiOjE2NzQ4OTYyNzAsImV4cCI6MTY3NDkzMjI3MH0.AwWxTOCuaqax5CgyWo6ARip8FdYGYBbgYEOdmeMRtFM');

-- --------------------------------------------------------

--
-- 表的结构 `user_admin`
--

CREATE TABLE IF NOT EXISTS `user_admin` (
  `id` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `user_admin`
--

INSERT INTO `user_admin` (`id`, `username`, `password`) VALUES
(6, 'admin', '$2a$10$EvImStuDP/PptVoUUQk.4.nuC8iM.nkGwEdTW68B0hlOk3N7.DBOW'),
(7, 'test01', '$2a$10$8vCm9FLvVtLwMKHNz.zcK.ghorQ0OU5UeTVK3G1tkVhfd3UQ00wu6'),
(8, 'zzz', '$2a$10$RsPZ6h3qCc/QQzFdj7KH8uKEQPD5R7QwXi6oklb3i2qUkIXnbmwv6');

-- --------------------------------------------------------

--
-- 表的结构 `user_pic`
--

CREATE TABLE IF NOT EXISTS `user_pic` (
  `id` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `userimg` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `user_pic`
--

INSERT INTO `user_pic` (`id`, `username`, `userimg`) VALUES
(33, 'test1', '/public/photoWall/2f20afdc208d21a1c79af0e466a155a5.jpg'),
(34, 'test2', '/public/photoWall/u=1470854780,2594190446&fm=253&fmt=auto&app=138&f=JPEG.jpg'),
(35, 'test3', '/public/photoWall/u=1508964261,2276174597&fm=253&fmt=auto&app=138&f=JPEG.jpg'),
(36, 'test4', '/public/photoWall/u=1713258743,1216056962&fm=253&fmt=auto&app=138&f=JPEG.jpg'),
(37, 'test5', '/public/photoWall/u=3333168482,2116805664&fm=253&fmt=auto&app=138&f=JPG.jpg'),
(38, 'test6', '/public/photoWall/u=4032728184,1229822325&fm=253&fmt=auto&app=120&f=JPEG.jpg'),
(56, 'admin', '/public/photoWall/img-1672447557201.jpeg'),
(65, 'admin', '/public/photoWall/img-1672504364474.jpeg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `article_classify_table`
--
ALTER TABLE `article_classify_table`
  ADD PRIMARY KEY (`cid`),
  ADD UNIQUE KEY `classifyId_UNIQUE` (`cid`);

--
-- Indexes for table `article_table`
--
ALTER TABLE `article_table`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `messageboard`
--
ALTER TABLE `messageboard`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `reply_table`
--
ALTER TABLE `reply_table`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `iduser_UNIQUE` (`id`),
  ADD UNIQUE KEY `username_UNIQUE` (`username`);

--
-- Indexes for table `user_admin`
--
ALTER TABLE `user_admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `username_UNIQUE` (`username`);

--
-- Indexes for table `user_pic`
--
ALTER TABLE `user_pic`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `article_classify_table`
--
ALTER TABLE `article_classify_table`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `article_table`
--
ALTER TABLE `article_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `messageboard`
--
ALTER TABLE `messageboard`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT for table `reply_table`
--
ALTER TABLE `reply_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=77;
--
-- AUTO_INCREMENT for table `user_admin`
--
ALTER TABLE `user_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `user_pic`
--
ALTER TABLE `user_pic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=68;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
