-- phpMyAdmin SQL Dump
-- version 4.2.5
-- http://www.phpmyadmin.net
--
-- Servidor: localhost:8889
-- Tiempo de generación: 20-05-2015 a las 11:30:02
-- Versión del servidor: 5.5.38
-- Versión de PHP: 5.5.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de datos: `construir_tv`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accesstoken`
--

CREATE TABLE `accesstoken` (
`id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expires_at` int(11) DEFAULT NULL,
  `scope` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=94 ;

--
-- Volcado de datos para la tabla `accesstoken`
--

INSERT INTO `accesstoken` (`id`, `client_id`, `user_id`, `token`, `expires_at`, `scope`) VALUES
(3, 1, 1, 'N2Q1YzFlMDQ5OGQzMzg2NjIzMGNiOGQ0ZWEwNzMwMDYzOTcwZGU3YjA1NTJkNjZmNjM4Y2QzYmVkNmRjOWNmYQ', 1429850139, NULL),
(4, 2, 1, 'NGE4NThmOWJhMGJhMGQ3YWU1MTRlMzkwYzVhMTU5YmRkNmQ1ZGI0NTgzNzIwYmVlZjE1NWE0YzZiMzMzMWZkYg', 1429926951, NULL),
(5, 2, 1, 'OTllZGQ5MTZmMWRjZjhmZDAwODcxOWE1YTJiYjRlNjRlNThjYzdjNmVkYjhiNzI4ZDNiOWU2ZTI4MGE5ODA4MQ', 1429927773, NULL),
(6, 2, 1, 'ZDUyYzY1OTYxNjNkMjFjZmY2YzVkY2JmMDZlMmZjYmQ2N2ZiYWY2ZDM4MjdiMDQyZWZhZGNmNWQ2NDM4NzM1ZQ', 1429961544, NULL),
(7, 2, 1, 'YTg1ZDE4ZmZkMGEzNjgxMDg2M2EzMDEwZGI1NzAyN2U0MWQ2MmU3MDg1M2I0MzgzY2IxOTJmMGQxYzczNDJjMQ', 1430020622, NULL),
(8, 2, 1, 'Y2Y3ZDdiYTQ3YzRkMGJlOTQ5NWZiZDcxOGEyYjIyZjdiMzg4YmJmYTdlOTQxNDlhYzc4OWU3MzM3YjdjODE5NA', 1430020744, NULL),
(9, 2, 1, 'ZDcwOTE1YTE3NTZhOTNhMWQ0MGFiNDBkMmE5OTM3YTFlMThiODU4MmMxM2QyMzUyNTRhZjJhY2IwNDlmYmMyZQ', 1430020867, NULL),
(10, 2, 1, 'MzRmMjZkNmU5M2M2OTk4OTQ3NzMyMjczMjZiOGM0Y2ZiNTYyMWFjYmY1ZmQxYWU0ZGFkODhkNjYzY2NkMGM0MQ', 1430029309, NULL),
(11, 2, 1, 'ZWZlYjBmNWExMTJjNTQzYTdkZDY2NWI0OWU0N2VmN2RhZTE0NjU1MTYwZGU0Njc3NTJlNDc0OGExOWU4ODkyNg', 1430081574, NULL),
(12, 2, 1, 'YzZiYjhmNmIxYTcyMTY5MTU3MGQyYTJkZGNkMzM4N2JkZWZhNTBjYWYxNjA2MDM1NWNkMDcxMjYyM2VlYTNjNw', 1430089727, NULL),
(13, 2, 1, 'OTgwMzZlOGMwYmM0ZjM5OWUzMjhhM2I3MjViYzBmMmFhYzE3Nzk3OGY3NjY3MzA4ZDBlYThjNWFiYzY5YzNiMg', 1430117045, NULL),
(30, 2, NULL, 'OTZiYTA3ZTU2MjJmZmUzZDRjYjA0MjA2ZGQxMTU4MWVlYTQ3ZDQ5YzRiMGI1OGQ4MTBjZjQ1NjMzZGNlZjA0Yg', 1430259061, NULL),
(31, 2, NULL, 'ODA5NzRlM2U0MmE0YjRhOGZkN2RiMzNjNTk3ZThkZjdjZmZhMDI4OGY0MDI1ZDAwNmNkOTUwMjdkODllMjE0Mw', 1430259083, NULL),
(32, 2, NULL, 'NWRmY2ZjMzE4NjY0MTViMDU1Y2Y1YWNkYTY3N2I2NGI0NGY0NTkyMGUwNDY2NjIwOTAzNmRlOWE1MmUyZjliMA', 1430259098, NULL),
(33, 2, NULL, 'MjMwODE3YmE5M2E4MjJlNzRlNWI5MjgwNzMyZjcxNGNjM2ZlNTQzZmQ4NmI1MWNjYTc0YmI5NTEwZGVkYzA2ZQ', 1430259444, NULL),
(34, 2, NULL, 'MzA0MDYwM2I0Y2Q3ZTZjMzRlODcyNTNkY2FiNjJmZTgwMGQ2MTkzNWI3MTFkMTA2OWQwOGE0YWEwMmNkMThiNw', 1430259463, NULL),
(35, 2, NULL, 'NmJhZjUwNGFkOTg1NGVmMGFkM2M2NmJlNTg0Y2Q3NzI0N2EyODNjMTEwZGY2NzM1Yjc2OTM5MmYxOTdlZDBkYQ', 1430259816, NULL),
(36, 2, NULL, 'MmU4Mjg5YTYzY2I0MTlhYzA2N2Y3MjA5MjhhZWUzYzk2M2M2ZmZkMzEyODg4Njk5MDMwOWRiM2VhNTA1MjM4Yw', 1430259839, NULL),
(37, 2, NULL, 'NWQxMTNmMzA1NzNlMjRhYjNmMjJlNWIwY2MyMThhOTZlMjk1ZDUzMThlM2Y1MGY3ODZhYzU5NjNiOGY3ZjcyYw', 1430259962, NULL),
(38, 2, NULL, 'NDVkZDI3NzFkZGIxOTRhZjM1ODc1OGQyMjExNjE0OTMyMWNjNGU3YjJhYWI0NWIzNmViNWI0YmU5MTk1ZTI4Zg', 1430260377, NULL),
(39, 2, NULL, 'Njk3NWY4ZjFmNWVkY2UyZWM1MjVjNTdiM2I1ZmY3M2IzMzAxYzk3OTcwNTkyOTM0NDVmMTUyNTA0ZjYwOTgxOQ', 1430260386, NULL),
(40, 2, NULL, 'ZDQzMDgxOTIwZGQ1YzU0NGQwZGIzYTk5NTA2NGFjZWRjMjdlZDZhZDc3ZmZkNTUzNDgxNDNmNjA2MmMyZGQxNg', 1430260446, NULL),
(41, 2, NULL, 'MTEwYTdiYWQwZjg0MWIxZTliZTBkNTkzNjc3NTUyZjQ1MjU0NzVjZjUxOGZmODY0YmJiNTkwZTUyMWE2ZjEyYQ', 1430260597, NULL),
(42, 2, NULL, 'YWY0MDQ5MTk3YTMzYzhkNDc5MmQ0OTljMzc4NDkxMzg0YzE4NzNkNWEwMTZhZmM2MzYyZGU5Mjk2NzBiNTk4YQ', 1430260607, NULL),
(43, 2, NULL, 'OTEzYzYzYzBlYTc2ZTM5OTgxOTk2MDYxN2VlZmEyODQzY2YwMTdkNjE1M2RiZTVmZDQ0ODgwY2FkN2FkOWEzNA', 1430260616, NULL),
(44, 2, NULL, 'OTE5ODc1ZTUyNjQwZWJkMDgwMTUzNTJhMjE5Yzc2MGJmMTYyNzY4YjUzOTVlYTBmNTA1MjIyNDMyZjA1OTE0ZQ', 1430260636, NULL),
(45, 2, NULL, 'ZTIyYmE4YWZmZDBkM2EzODNjMTg5M2ViODMzMzljNWYxY2JjNWYwOWZlM2RiNTljM2Q3NmUyZWU5N2FhYmJhZg', 1430263428, NULL),
(46, 2, NULL, 'MzYxMjlkYjEwNGRiZWIzNjRkMmQxMzM3NWM1NzhjYzQxZjZmZTc4YjgzMzY0OTYxZGZhYzQ3NDIwNzczMDdmMQ', 1431466152, NULL),
(47, 2, NULL, 'YjQwMTM3YzVmMzc3NTcwOTVmYjE2N2M2MmY2YTA2YWY2N2E2Mjc0Mjg0OGQ5NmUxZDU3OTdlNDc4YjVmNWNhMQ', 1431467073, NULL),
(48, 2, NULL, 'ZGFmOGRlYjE4MjJiNWYyZTRmMWFhZTFmMmQ1ZWMwOWRiNjQ4MzZhM2FlNzI5ZmM1YmNkMzZmYjc0NGI1NzZkZg', 1431467088, NULL),
(49, 2, NULL, 'ZWNkOTY0NWNiMGFiZGUzYjdjN2EyMDU3YzEwOTI2NjRlYzkyMTcyOTE2N2U0YmU0MTU2YTQwMzQ1OGZlMjY3Yg', 1431467145, NULL),
(50, 2, NULL, 'NGMzNjZjN2YwYmU3YjU5OTk5ZmY0MTBkM2Q4NzZhZjc5NjUxMGFiOGQ0OTg4ZTFjNDFiOWIxM2E2ZDg5OTEwZQ', 1431467231, NULL),
(51, 2, NULL, 'Y2I1ZWI4MjgxZjAxYzM5ZWE1OTM2NGYxZGJlOWVmZGMyMWUyODg0ZTE2YTU3MTQyOTUwYmNiZjM1NTNlMDBlZA', 1431467262, NULL),
(52, 2, NULL, 'MTBmMTE4NDJhNzdmODY3NzFlZTMxZDJhZDRkMTc5ZGFlMjQxNWQ1OGExZWYxYmZlMDBkMDU5MDE5YjQxM2NiMg', 1431467528, NULL),
(53, 2, NULL, 'ZDc0ZTM4Yzc3YTQxNzg0Njk4NzcxOWE3ZWIzMzQ2NWU5Mzc2YTIyOTA0NmE3OGUyOWNhNGY4YzdiNGZkMDgxZQ', 1432394005, NULL),
(54, 2, NULL, 'MzZjZjU2NTcxNzk1MTU2ZTM1YmE5ZjAyOTRjODg3YzQ3MWY2YmZlYzRmMjMzOTlhYzQ3MGEzZmU5MjVkNzM4ZA', 1432394262, NULL),
(55, 2, NULL, 'Y2NjZmNmNThlNDJmNDFkYzg1NmNiYjRlMzlmMzU4M2M2YTE5MzhkZDcwZWIxZDZkYWNjMTM2ODhmYTU3YTQwMw', 1432397176, NULL),
(56, 2, NULL, 'NzdlMWQwZDM0YjA3ZTU5YWMxNmZjMzcwYTJmMTcyN2EyMGRiMTlmMDY3YzEzZTcyMWJiYTI3MjU0ZGVjNzI5NA', 1432584647, NULL),
(57, 2, NULL, 'MzM1YjBiN2Y2MWMzM2FmMzRkZjU5YzE3ZTMzNDAwYTYwMjExMDI2MTlkMjFhNTcyNjRmZjcwNWZjNTgxMDM5Mw', 1432635354, NULL),
(58, 2, NULL, 'OTRlYTEyNWQ4NjA3OTM0MjQyMjY4NjhmYWZkOTU4YmZjODJhNGY5OWJhNmIzOTU3OTMwNjZjYmQzMjRmMGQ3Mg', 1432635770, NULL),
(59, 2, NULL, 'OTdjNDQxMjA2N2VjOGIwOTc1YzEyMzVjNTgyNzMzNTRjMTQ2MzU2NTIyNGQxZDM1YTRiNjFmZjhlMmRiZWQ0Yg', 1432635824, NULL),
(60, 2, NULL, 'NTYwMDM5NDAwODE5MTgzYmFkNTg2N2Q5MGExZmE1YmNiMTExOGE2ZTE0Mjg3YTY3MzE1MjI1NTBlMzUwYjZkNg', 1432636447, NULL),
(61, 2, NULL, 'ODY4MjA2YjkyOTM0NTAzYzVhYjY5ODY4ZDA3ZGI4MmM4M2VkMzA0MzM5NjQ1NDY2NjYxYjc5YzgxYTE1ZTY4Mg', 1432636522, NULL),
(62, 2, NULL, 'YzQzOTA2MDNhNzE3ZDllZmE3NGQ4YjA3MTcxZjIwMGQyMTk5MmU0M2E1ODY5ZmJmMTBmMTUyNTVlMWRkNzA1Yw', 1432637308, NULL),
(63, 2, NULL, 'ZjM3MTEzOGQ5MzA2MTgyOGEyYzNlYWM0ZGVmZWVjYmIwNTRkNTBmNzUwMTUwZDk4OGY5ZWRhZDJhODkxYTFkOQ', 1432637670, NULL),
(64, 2, NULL, 'NDM3NGUxOGFiNzQ0ZDRkNDFlZGVhZjk0NGVlOTEyOThjZGJlYzY1YWM1ZjQxZmI1NTI1NjMwYTk2YmUyYWVlNw', 1432637962, NULL),
(65, 2, NULL, 'NjFmNGViNTlmOTIxNmJiMzNmOGMxMGIxM2Y2ZjEyMmIzYzFlYzA0YmRlM2Y1MzNjY2VkOTJjNzgzMjM1MGNiOA', 1432638112, NULL),
(66, 2, NULL, 'ZWM4MTY4NWI1ZTljZjQ5OWMyMzU3NDEyZDdjZTRmMDEwMDg1YzI4NGMwODNkMWMzZjdjMTllN2JhMzU3MjJkZQ', 1432638891, NULL),
(67, 2, NULL, 'ZDJiYjQwN2JiYTgwM2ZkYTczN2I5NTg2Y2NkNTk2MmY5NjMwMWMyZWJjYzgzZjUyMTQwNTlmOTcyZmYxYjhkZA', 1432638922, NULL),
(68, 2, NULL, 'NjRiMWViOTIzYTFiMTgyMDFhMGVhYTM3YTc0OWY2YTU0ZmVjMjYzOWZlNjM1NGUwNjU0NmI0MzIzYjM5ZjcyZQ', 1432638958, NULL),
(69, 2, NULL, 'Nzc1NWFmOGFiYTcxYjdiZDY3NGNmZTVkOGFjMGU2MDllNzdjZWIzMGU3NzgxYzdlOTU2MzA0YjM5YTYwZjc5Nw', 1432640567, NULL),
(70, 2, NULL, 'MmRmMTQ0YjMwZTUxMzBhMmY5ZTVhMTM5MTkyODFjNmY3ZTI5ZWFhNGMxZjk4YzAxMjJiZGRhYWZkNDNhNzI4Zg', 1432642002, NULL),
(71, 2, NULL, 'Nzk1OTAwZTBkN2VmZjZjNGVjODkyNWQ4OWNmMGZlZDEzOTk1YmM0Mzg0NDFlZTJhM2VkYzJkZTJjNWVhNGZjMA', 1432653819, NULL),
(72, 2, NULL, 'NTNkNjhjYTllYzM1YWMxMjEwYTU0YmM0YWU2MWQ4YWY2NjEyZjgyZjA1ODdkNjExZDdjMGE5MzM4YmJjMjBjYg', 1432653837, NULL),
(73, 2, NULL, 'YWUxOTI2YmI2YTVhNGZiOWQ5ZTM1YzBlOTk0Y2JlZGQ1ZmJmYjQ4NDBjZmRhNWYxMTBiNWYyYjkwODg3MTA3OQ', 1432653953, NULL),
(74, 2, NULL, 'ZjQ0ZGI5ZGJmY2IzMWY3MjNjYzJjMjQzMGM5YWU0YjAyODdjNjBlYjljOGQ0MGZkY2Y2ODYxZDNiYzcyNWJkNw', 1432653998, NULL),
(75, 2, NULL, 'ZTAzY2RhMzdlODU0YzRlMzhjODgzMzM0MjdmNTk5M2U1OTFlMWViMTZmM2IyYWUyMmU5MjZjOGVmOTBkMjU5Mg', 1432654620, NULL),
(76, 2, NULL, 'YWNkZjc0MjlkYzg4MWMzNmNiNTA4YTVmMzQ2OGQ3ZmU4MTMxZmZiYWMyNjY3NWE3NzM4NmZhM2ExZGM2MzRjYQ', 1432654653, NULL),
(77, 2, NULL, 'ZDRlNTc5MTM2ZGFjMTcyODJkYzhiZGI3ZjEzY2E0MTQ3ODc3YTgyZmYwMGFiYTU5YmEzYWI5OGFjNjhkZmQ4Ng', 1432654889, NULL),
(78, 2, NULL, 'ZDM5NTQ2MTgxODgxMjgwMmFhMDc2OTRmZmMwYjc3MmJiM2ZiOWM3YzM2NDRhZjU1NDY0YTBkY2IxZGQzYjg4Ng', 1432657520, NULL),
(79, 2, NULL, 'ZTVhNDU2ZmFmOTU2YjJmNWNmZjE3MTA2ODc2YzVlYWQyYTM2MTEwMWJhMzNiNDNjMDc1YjE1MjBkNTA0NmRiOQ', 1432661926, NULL),
(80, 2, NULL, 'ZjlkOTc1MjE1MTVjOGM4NTRlN2VkOTJmYTUyMjkzNzI5NjczMTY5ODllMzMzOGE5YjhhMTk2ZmFiMjIxNTliMQ', 1432809438, NULL),
(81, 2, NULL, 'NGUxYmIyNjU2MWMzOTljOTMzYWE2ZTQyNDE0ODA1MDIzMzY0MWY1OTMwMzY1M2FmODRiMjNhY2YxZWU3NGQzNQ', 1432809555, NULL),
(82, 2, NULL, 'OThhOWVkNzVmYzBjMTk1MGE5OGZiZGY1OTdlZmM0YzgxMGZmNDM2MDBhNmU3MWVlOTQ3OWY5ZWZjMjU3NDYzYw', 1432809693, NULL),
(83, 2, NULL, 'ZjVlZTJmNzYzMTcyYTNjYmViZThlYmE4NThkMjE2MzY1Yzk2MTRjOWM5MjJmOTgxM2NiOTBmMTE1NjJjZDdmOQ', 1432811513, NULL),
(84, 2, NULL, 'N2NmNThiM2FmNTk5ZjQ2OWY1NTczZDljMzdkMjQ3ZDhlNjVhYWI0NzViMTE2ODkxNTZhOWFhZTIwODc2Y2E1OQ', 1433064289, NULL),
(85, 2, NULL, 'OGE2OWVkNTBkNzUyN2Q5NWI4ZDJmNTAyYzlkNTljN2NmNTEyMWYwNGM4MTRiMDhkZDlhYjRkOTc2YzEyYmQ5Mg', 1433066016, NULL),
(86, 2, NULL, 'Y2U5OTQ2OTFhMmEzNDM5OTI2ZTA0NThlNTI0ZDI0ODgxNTY2MjFjY2Q0OTI1ZTQ5ZTgxOTVkNDQ1Yjk4MjIwYg', 1433262322, NULL),
(87, 2, NULL, 'MmQyNmU3MDJiYzA5ZTc1OTM0ODA2NTAwYzVkZGRmYzk2N2ZiZjkyODFiOWYxODNlNTU1YWM2YWE0MGI4OWRmZA', 1433285726, NULL),
(88, 2, NULL, 'ZTc3YjMzMGU5N2U0YmRmODYwYzU3OTZkZDIzMGUzOGI2NjNmMzBiM2U5Yzk4NmIzMTljZWY0ZjdmOTZjMDU0YQ', 1433286577, NULL),
(89, 2, NULL, 'NDdjZGY5YzhmNTk5MTI5YTVjYWMyMDg1MWVhZTIxMGY4ZTIzOTcwODIyN2EyMzg3NGJhMDQyZGFlYzY4ZDNmYw', 1433287536, NULL),
(90, 2, NULL, 'ZTAzNzBhZDFkNGQzNjEwZmNmMWQxNjdjMzkxMGFjYmU5YmU4NDM0YWI5YWNiNGExYTMwNDUxZmQ3M2M3YjFlZA', 1433291873, NULL),
(91, 2, NULL, 'Yjk4OGViOTc3ODUyMDI2Yzc2YTMwNWFmMzk1NzY1MGQ2OWYxOWMzZDM2YWQxZmMxY2JiNzgxOTgzMzdhNGQwZA', 1433292294, NULL),
(92, 2, NULL, 'ZjQxNWIzMTNkMzlkNmUyMGExNWJkNjEzNmFlYjgyMTExNjA1NDY1MmIwMmMwNWJiOTEwNTUxNzEzNTc3NjM4MA', 1433292884, NULL),
(93, 2, NULL, 'MzUwNGE5YjM2MGIwNjI1YzA0NWVjYzdhNDAyZjkxYTljYzY3NjRlMzdkMzcxYTg5YWEyMzVjNjE0M2Y1OTNlMQ', 1433295067, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `authcode`
--

CREATE TABLE `authcode` (
`id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `redirect_uri` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expires_at` int(11) DEFAULT NULL,
  `scope` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `client`
--

CREATE TABLE `client` (
`id` int(11) NOT NULL,
  `random_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `redirect_uris` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `secret` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `allowed_grant_types` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `client`
--

INSERT INTO `client` (`id`, `random_id`, `redirect_uris`, `secret`, `allowed_grant_types`) VALUES
(1, '2cbag5qz7mas8wwoo8c0w0w4s0ss40sc488sogsss84ws44sg8', 'a:1:{i:0;s:22:"http://www.google.es";}', 'c9u7xs1065kow804ockk0o0ccwsgkws40o84sscw8og0cg4go', 'a:5:{i:0;s:18:"authorization_code";i:1;s:8:"password";i:2;s:13:"refresh_token";i:3;s:5:"token";i:4;s:18:"client_credentials";}'),
(2, '3yhgp61uxcys4gs0sw4oos008c0wkwokkw4g0k0044sk8kso0k', 'a:1:{i:0;s:34:"http://localhost:8000/api/articles";}', '1frw8e9jdcw08kcg844k8s8cksowk48gogo848soo4kkowc88k', 'a:5:{i:0;s:18:"authorization_code";i:1;s:8:"password";i:2;s:13:"refresh_token";i:3;s:5:"token";i:4;s:18:"client_credentials";}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `generos`
--

CREATE TABLE `generos` (
`id` int(11) unsigned NOT NULL,
  `nombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `generos`
--

INSERT INTO `generos` (`id`, `nombre`) VALUES
(1, 'Social'),
(2, 'Educación'),
(3, 'Gente'),
(4, 'Industria'),
(5, 'Ecología');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `refreshtoken`
--

CREATE TABLE `refreshtoken` (
`id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expires_at` int(11) DEFAULT NULL,
  `scope` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=76 ;

--
-- Volcado de datos para la tabla `refreshtoken`
--

INSERT INTO `refreshtoken` (`id`, `client_id`, `user_id`, `token`, `expires_at`, `scope`) VALUES
(1, 1, 1, 'OWY1NGIzODA2ZDM4MGNhZDM2YTU0ZjQ1NzI0ODhkYTIzM2ZkZjIxY2YwOTY0NjM1ZmZlM2RmYmExNDM2NjFjOQ', 1431056139, NULL),
(2, 2, 1, 'ZWMzYTQ3MGFkMDEyZjI5N2QzZTE2ZGQ3MGQzMDg1YzY1YTM0MWQ0MTQ3OWY2MjYzMTgzYWE5ZmQyYzhjOGMzZQ', 1431132951, NULL),
(3, 2, 1, 'YjU2YzRmYTAyYjdiYzI5MmM1NDkyNjYzMWQxYjg1ZjRkYjRhYmY0YjIwNjY3MDNmMDVkZDM1NzdmNWY1NTM0Ng', 1431133773, NULL),
(4, 2, 1, 'Njk2ZDg4ZmFmNjU4YmUzMGEwY2EwMmY1NDY4ZjAwOWYyMjdmYmZhOTJkZTk5NjBlNjBhOTcxMjdmMDg3ZWFkYg', 1431135144, NULL),
(5, 2, 1, 'MzNkNjUzNjk2MTBkYzI5MmM0ZmE4YjY5NjdjOGFhYjczMmJhYTRhYWNjMzdjM2I1NzZmMDAzNzU4NmYzOTZhYg', 1431194222, NULL),
(6, 2, 1, 'N2RhMTlhMjIyMDhmN2I4YTE0MmIxMGNkNzg5MzcyMmY3NTQyYThhMzdjMWEwMjMxYjEzOGM5YjVkYTQxMzlmOA', 1431194344, NULL),
(7, 2, 1, 'YWY1MzNhZDdlMWE4NDc5Mzk2ODA1ZjMzMGEwZTA4MDc5ZTk5MDU3NTMzNDdiZmM0NzNiYmU0YTU3OWRmOWI3Nw', 1431194467, NULL),
(8, 2, 1, 'ZGIzMzk1MzFiZGRhYjFhYjY0MjY1ODg0YzMxY2Y3ODJjYjllOWNiYjMxZjEwYmI0MGRhYzYyNDY3MzJjZDUzMQ', 1431202909, NULL),
(9, 2, 1, 'ZjE4NDRmNjY2ZTcwYWE2N2QxYjdmMTQyOGU1YmFhOTI4ZDJhMzc3ZmZhYjJjNmRjZDdkNmIwMGE4NDgyODdmMA', 1431255174, NULL),
(10, 2, 1, 'NjBlMmFlZTg0ZWI4MWY0OWM0YTlmYWVmYjEzNjhkNDA5ODFjYmFjNGNkNmMyMDFjNTllYWYwNDlmODNmMGU2Mw', 1431263327, NULL),
(11, 2, 1, 'ODE1Y2M4YTBmNmM3MGZhYzE2M2MwMDkxOWJiOTMwYjVmOTMwNWZhNWRkMGQxYmJmMDZiZDRjNGIwZTU3Yjc2Mg', 1431290645, NULL),
(12, 2, NULL, 'ZWNiMzllNjZjZWVmNDNmYTU4ZTgyNjkxNDg0YzkzMDYwZjM1NDI2NWJiZjliMjBjZmJhNjUxZWFkMTkyZWMyZA', 1431432661, NULL),
(13, 2, NULL, 'YTM5YzZjYjljYWEzY2U5YjhhYWE0NDAyNTU5OTI1N2ZjOTc0NmQzMTlhMzNiMmUyZGY0MDJiN2JiYWVkN2QyYQ', 1431432683, NULL),
(14, 2, NULL, 'MGE1MDg4NjZhMjljNGViZWY5ZjM4Mzc2ZTU1NzNmN2U0NmNiYTAxOTljNmZjNDliM2VkMmI2ZTA1ZjQ1NmFhMw', 1431432698, NULL),
(15, 2, NULL, 'MjU1NzFiNWNlMmQwNzU3YmZlNmU4MzEzNTM0MTc5NWVlY2VmYmZlODQ4OGMyMGVjMzIwNTBlNWFlZjE3MjFjNA', 1431433044, NULL),
(16, 2, NULL, 'ZjNmZjI2NTM5MGVlZjcxMmEwNjFkNDhiN2FlYTYwNmQ0MDc1NTFlNzg2YzYyMzcyMzVlMTM0ZjMyYmQxZjRiMQ', 1431433063, NULL),
(17, 2, NULL, 'YTMxYjI0YjE1ZWUyNDVkNmU2M2E0NTdiMDQyZmFjMDRkNzk4ZTlhNDczMzliNDUzNDk2M2E1M2VjNjNlMWZkNw', 1431433416, NULL),
(18, 2, NULL, 'MGFiMDVkYjQ2NThmOTQ0M2I0MjA4NTYzMzljNmM3OWU0ZjEyNzFmM2YxOTlkMmFkNDRlN2QwYzg3MzhkZjQ3ZA', 1431433439, NULL),
(19, 2, NULL, 'YWY5MzUxZjA1ZTBiNjFjNTA3Yzg3ZTc4YWQyNTA4MDNiYzY1YTg2ZGUxNTc1MTRlYjYwZDY5YWI2ODcyOGUwNg', 1431433562, NULL),
(20, 2, NULL, 'YmI2MzE5N2U4MzMzNzM2MDMxYTg4ZjljOGViNzUxOTU5NjZlMTVmOTI2ZjE2YmQwZjQ3YzBjMGI5YmY0ZGIzMw', 1431433977, NULL),
(21, 2, NULL, 'NzhmNjIwMWI2ZTYzMTZkMzE5M2IzOTY5NWIwNjRjMDMyYTlmOGEwOTk0MTQ0MmIyYzE3ZDkwMmY3ZDY3NmRiZg', 1431433986, NULL),
(22, 2, NULL, 'YzQ5ODFkNjhiZDFhMzExYmQ5ZWJlNGE1ODRjYTI5OTVhYjlkN2ZmMWI2MDBhOTQ3NDcwZjE1OTNiNmYxYmFlMg', 1431434046, NULL),
(23, 2, NULL, 'MGZlNzMwNzFkNjExOGEyN2U4YmE3NDg5ZWQ1Zjg0NjdlMWJmMDg4MGFmNDIzN2M3ZDg1MTU4M2RjYmM4MjVlOQ', 1431434197, NULL),
(24, 2, NULL, 'ZjVkMzgyYjExZGYwZDc0MDFhZDBlZGMzODg4YTVjODVhZTcwMDI0OTI3ZTNlNGFmODM4YmIyZTRlMjk0ZGJiOA', 1431434207, NULL),
(25, 2, NULL, 'YmM5YjFmMWVmMDM4YTA3YTFiMjkzODA1ZjZhYjFhZTMxOGJjYTliMzA1MWUzY2ViOTJmNGM3NWQwYzgzZjk4YQ', 1431434216, NULL),
(26, 2, NULL, 'Y2JkZDZhZDRmYjBmMzI1MzdjMzQyN2QxNWYzOTcxOWI1MjI4NjYyMjA2MDAwMDg2Yjc5YzAxMTFmYWM1MjdjMw', 1431434236, NULL),
(27, 2, NULL, 'OTY1NjA1NWEwNTBkNzFlZTNmNjA5YTAyZDZhMWY4NTU0MjQ4NDRiN2ZkNGYzMmUyZmRhMmZiMTgzNDdiNjYwNA', 1431437028, NULL),
(28, 2, NULL, 'N2EzMTEyNzQxOTM1OWZhZjA1ZjM3ZGYxZTlkZGI0NTY1OGY0YjBkNDBlOGNlNGViYmE1ZjZjOTAyZTczZDU4MQ', 1431466152, NULL),
(29, 2, NULL, 'Yjg5ZmJiYmYwYzU3ODFhYTQzZDk0MjhlZjU3OWJkZmM4ZThlY2JlNGNiYjgwODE0MGY4ZDM4MTAxY2YwODA3OQ', 1431467073, NULL),
(30, 2, NULL, 'YzM1YWVhNWEzMjVmMDFiOTc1ODhjMmZiNGNkY2E2NWU0MTZmNWM1ZjcxZWE0MjkwNmY2NjIxMzViYzJlM2EzOA', 1431467088, NULL),
(31, 2, NULL, 'NmNkYmVkMjM5MjBjZTY3MTcxNGI4OTI0ZGVlN2FiMTA4NGQ4NzVjYTkyNWQwMzgyZjYwMDAzY2RlZTY0MjEwMQ', 1431467145, NULL),
(32, 2, NULL, 'OTdiZDU5NjAxZDQzNzhmYzcxY2MyZThiNDFlN2UyYWFlZjQ5OTJjZTMyMDFhM2U5YzNlYjIzOGQ5OWM3YjZhMw', 1431467231, NULL),
(33, 2, NULL, 'ODFkMzM0MmZmNjhkMTVmNzc4OWExZGQwNWYzY2Q0ZmY4YjQ1NTllMmJmOTM4MzE0MzgxZTI0MWVhZGJkMDdkYQ', 1431467262, NULL),
(34, 2, NULL, 'OTQxN2U0MzRhNTIxNzA0MWU2MDg4Y2YwYzE5OTJmNWQ5MzBhMzczNDRiMGM3YzgwOWZhM2MzMGQyYjMxZTc0ZA', 1431467528, NULL),
(35, 2, NULL, 'MmUwOTU1MWY2ZTAxZWEyNDQ4YzhjY2EwZTBlODkxZjVmNjRlZGY4ZDQ5NjMyZGI1MTQ4ZTdkYTBmMzY4OGY1Ng', 1432394005, NULL),
(36, 2, NULL, 'MGRiNDgxY2Q3ZTc0NzUwMWQyMGIzOWI3ZmMwYzMxNGQ0ZjMxOWJhNjYwNWQwMTI1NDQyZGFiMTM3ODEwMmI3OQ', 1432394262, NULL),
(37, 2, NULL, 'OThkZGU3ZWYxMWUxODFmMTQ0ZTgxYjgxNzJiNDc2ZjdhN2JlMWQzNzUyMjhlOTRhZmE5MTVhOGMzMWVmZjU3Nw', 1432397177, NULL),
(38, 2, NULL, 'N2E5NTI1ZTgxMjBmMWMzYmRiYjE5MjU3ODFlNzlkZjc3ZDhhYzA4ZjYwMTg1ZDRjMGMxNDcxODRiNGZhNjkzZA', 1432584647, NULL),
(39, 2, NULL, 'Y2Y3MmQzYmQwZWRlMGU2YWIyNGQyZjhmNWJhMjc4ZTVkN2ZhZGMzZGNmNjJlMmI0NDMyODNkYzExN2RlYmY2MA', 1432635354, NULL),
(40, 2, NULL, 'NTJiMDExZmYwNTlhNTM5NTE5YmFmM2E0NTI3NDQzNjFmYWFkYzVjYjkyMWMzZGI1NTg2ZjlmYmI2ODIxZWI2Mw', 1432635770, NULL),
(41, 2, NULL, 'MmM5NTI4OGQzOTllNzIwMDVlZjlkY2E3MzNhODhiZDhiMzlmOWE5YTliMmE2Yzk1MmQ0NThkNGI0Y2I5NGZiMw', 1432635824, NULL),
(42, 2, NULL, 'OTUxYmM4OTljOWQxNjZiMWM0MTkzNTdkNTEzZTViODAxNDQ0ZGFlZjkyZGFmMjJmM2Y4ZTFjZjZjNWFiZjk0NA', 1432636447, NULL),
(43, 2, NULL, 'NjQ0YzU1ODQyYTgxMTk4ZGVhNWNhNWZkMWY2M2VlZjc1ODgzY2RlMzljMjZlNjA3MDQ1MGM3ZWU3YjBlZDI5Mg', 1432636522, NULL),
(44, 2, NULL, 'N2U5NGFkMGQ2YTI5OGQ3OWQxYjNiYmFiMDNhOTIwNTU0M2QxMDY2NTY1ZmQ0Y2VmNmE4NmNhOGFkNmFmYTU5Nw', 1432637308, NULL),
(45, 2, NULL, 'ZDBiOGNiZDNlZjA1MmVhZTUzZWRmMjFmMzg5MzJmYWY4NmM1NzU2ZDczNjJkMTM0MTc2NjNlYzgxODg2NDYzNw', 1432637670, NULL),
(46, 2, NULL, 'YzUwY2I5OTIwYjk2MDY5NjIwYWUyZWNkOGYyODg0YTUwN2IwNDM1ZjlhOTgwNjNjYjkyODk4YTJhZjFjZmY4NA', 1432637962, NULL),
(47, 2, NULL, 'ZGY5MWM2ZDM0MTA2N2NmMTY5ZjA5MTMxZjQ5YmRmZTZiNzgxNGZjYTE2YjMyNGU4NTA4Zjc4NGQ2ZjdjZTczYQ', 1432638112, NULL),
(48, 2, NULL, 'NWFmNzRmNzliNTdlYTgwMTU2NzljMTIzNDViYTYwNGYwOGU4OTk3MGQ3ODU2NTM1ZGEwYTY5ODkwZTY3MDE0OQ', 1432638891, NULL),
(49, 2, NULL, 'NDA1MGJmNmNiZTk1OTVkNDRhNjc5MzkwOWFhYTZhMTQ5MmMzYTdlZTVkZWU0YTZlNjc0YmIwNGVlOTEzYmY5MQ', 1432638922, NULL),
(50, 2, NULL, 'Mzk5NGU2MDNlNGE0M2MxZmNjMzI0M2NhMjA3MTc0ZDdmNWIyZmQ2MmFkMmFhZTdlMTU2NGNiNGI0ZWZhMGNmNQ', 1432638958, NULL),
(51, 2, NULL, 'ODQwZTI4ZmI3ZThkODZjNzcwODczNDQ4Njg4OTc4MjBmNzkyZDhlMzE4OGMzNzY1ZTQxZGQ4MDgyODU1ZmFiNw', 1432640567, NULL),
(52, 2, NULL, 'YWY0NzYyYWIxMzhkNDQwN2JhYzM1MTk2M2EyODA5MDQzYjM2YjdjN2RkNDJiMGNkMGJiNTVjOGJhY2EyNDA3Ng', 1432642002, NULL),
(53, 2, NULL, 'NDhhOGQxMjUzN2Y5ZTFmZWM5NzAyYTgzNGUwODdlYWQ3ZDdkYjNhNGMyMTI3MDRjNjI0MzQ5NmNlMGE0OTBiOA', 1432653819, NULL),
(54, 2, NULL, 'OTAwNWUwOGQ1Nzk5ZmRmZmFjNTgxZmM1MzRhNzNkZGUyNjc3NWFkYTg1NjAzMmJmMGRhMjUwODJmYjNlNDRlZg', 1432653837, NULL),
(55, 2, NULL, 'YTljMjc5ZmViMmE0Yzk4MDA0MTMxZmE2ZDUxNTQxYzY0MzQ0ODQ2OTk4Y2RhOTVmNjNkMDI5MTE5ZTljNDQ0Yw', 1432653953, NULL),
(56, 2, NULL, 'OGNiMjc5ZGE0Mjk0M2YxZmY2NDEyMjQ0N2ZkZGJkYjllMDNmOTlmZmExYjdlNmE1NjU2MjAxZjY5ZDJjOWNiNA', 1432653998, NULL),
(57, 2, NULL, 'YTEwYjRlZjQ2OTVhN2IxMzM0YTQ1MzM2MzU1NzMzOGYxMmFiYWUyZTIwNjU3ZjQzM2E4YjI0ZWUwNTY3OGY5ZQ', 1432654620, NULL),
(58, 2, NULL, 'NGUyZjVjOWFmNjZhN2FjMzY2ZTc4MmFiYTQ3MzU2Yzc3OGVkMGJjOTZkYzcyYTAyYjE3Mzc1NGYzZDk0ZTJlYQ', 1432654653, NULL),
(59, 2, NULL, 'NzI1NDIwYjI1OGQ4OGNlZGFjYTc3NjU4ZTUzYzE5NmU0YzM2Mjg3MDkyZmNhMDg5ZDc2NmVkOGM0NTYyZTAyOA', 1432654889, NULL),
(60, 2, NULL, 'YWI1MWMzZjQ0MDg1ZDgzNTVkN2Q3ZmQ1YjBkNDkyNWU5ZDMzOGE1MTIxMDdjYzc4MDA0YzY2MzdiODZmOGIwMg', 1432657520, NULL),
(61, 2, NULL, 'OWI4MGVlYzIyMzAzMDE5NzhjN2MzOTdjMzI2ODg3OTVhNGZmMmQwMmM4YjIxNDliZDJmZTUzNzdjMDZlMzhjYg', 1432661926, NULL),
(62, 2, NULL, 'YjY1ZjU4MzM4YTQzMTYzZGI2NTZmMjE3ZDAzNDFiMzFkOWIxYWJkZTIxYmEyODc5Yzg1ZTQzZWRkNTgyODU0MQ', 1432809438, NULL),
(63, 2, NULL, 'ZGVkNjdjYTBlNjdiMDg2MjJmNTMzYTI3MGE5OThmMTI1ZWViYWU4YzdjNTJhMzdlMWJjYjkxMGVjZWJiZWVhNQ', 1432809555, NULL),
(64, 2, NULL, 'MGJkMWU4YWQxNWViNzI5OWFmZGQzYzYxOTI4NTIwNTRjN2MyMDA5MTE4MzY3MjAzZDk4YmM3ZThiNGJjMjg0NQ', 1432809693, NULL),
(65, 2, NULL, 'ZDdiYzZjMGI0MmNkNjliMWMzYTM4OGNmNDUwZWI3ZmZiM2U5MjVjZTAwODZkMzZlZjY1NTBkNTVlZDIyMzRmNg', 1432811513, NULL),
(66, 2, NULL, 'YThlNDIzNjAzNjhiYzUyNjY5YjdmYjM3ZTRlNDNmY2FjNWIxNGRmNzdjZjIyNzA5NGE1NzlkZTQ2OGY0OGViMg', 1433064289, NULL),
(67, 2, NULL, 'MThkZmIwMmMyYTU3OGFiYTBlYjg4OGZkYjJkYTRlNDQxMDc3NjM1Yjc3NGYzYzg4NjdhMDliMjM0ZjgzNWZlZg', 1433066016, NULL),
(68, 2, NULL, 'OTc1MTc5NGQwY2JmNjAyMTM1ZDExNTgwZmM3NTU4YTViZmViOGMzY2Q1ZTkyNGYzN2FlNjYyZTg0OTFiNWJlOQ', 1433262322, NULL),
(69, 2, NULL, 'ZWQ3NjA2ZjkyYmY3YmFhM2Q2N2Q2NjMxYzYzZjAwODQxZGQ4ZjhjMzc4OTFhMzRiNTE2MGE2YjM5NDNhNjYyZg', 1433285726, NULL),
(70, 2, NULL, 'MjQyNWY5MGQzNTI1Y2Q2NTM2MzY2Yjg5ZmYwMzQyMGI1MmExMjY4OTRkY2VlNzU5Njg2NmNiZmU5YTFiZGViOA', 1433286577, NULL),
(71, 2, NULL, 'N2RhY2IwNmJlZDgxOGEzMWQ5NzYyZTM5NDBiZDVmYmVlYTRlMjE3YzZmMDFhNTU4ZjkyNWM2NTE0MTAyNjk3Mw', 1433287536, NULL),
(72, 2, NULL, 'ZDYzNmExZjlhOWU0YmMyNGM1ZDM4ZjY1YmUyYzgzMmViODc1YTFjMmUyNzI2YTI2M2Y5OWE0MTRjNWUzNDA4YQ', 1433291873, NULL),
(73, 2, NULL, 'ZTU5NTkyNzhjMjJjN2E2ODliZmYyZWVkZWQzZDM2MmNiNTdjMDEzZWNjNzQ5MGZhMDZiMTk4MjI0MGE2MzM3Zg', 1433292294, NULL),
(74, 2, NULL, 'MDM2MmYwZjRmNDc2YzAzZmRlY2ViYWVmYmM2ZWUyY2I5OGRlNGZjMDkyOTUxZjI1MzU2ZmY4YzBjOTAzZTNiMQ', 1433292884, NULL),
(75, 2, NULL, 'MGZkNmQ5NmU0ZjYwZWU0OWYwODIwZGMyMmY1NjJlZGZkM2YzODliOTYxYzM0YTFhMjJjMmM5NjAxZTZkYWIxMA', 1433295067, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `series`
--

CREATE TABLE `series` (
`id` int(11) unsigned NOT NULL,
  `nombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `sinopsis` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `series`
--

INSERT INTO `series` (`id`, `nombre`, `sinopsis`) VALUES
(1, 'Pintura Bactericida', ''),
(2, 'Pavimento Ecológico', ''),
(3, 'Mecánico de Bicicletas', ''),
(4, 'Arquitectura Sustentable', ''),
(5, 'Industria Argentina', ''),
(6, 'Hermanas Lahorca', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `titulos`
--

CREATE TABLE `titulos` (
`id` int(11) unsigned NOT NULL,
  `nombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `genero_id` int(11) unsigned NOT NULL,
  `serie_id` int(11) unsigned NOT NULL,
  `nro_capitulo` int(11) unsigned NOT NULL,
  `duracion` int(11) unsigned NOT NULL,
  `temporada` int(11) unsigned NOT NULL,
  `subtitulado` tinyint(4) NOT NULL,
  `sinopsis` varchar(4000) COLLATE utf8_unicode_ci NOT NULL,
  `url_vimeo` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `destacado` tinyint(4) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `titulos`
--

INSERT INTO `titulos` (`id`, `nombre`, `genero_id`, `serie_id`, `nro_capitulo`, `duracion`, `temporada`, `subtitulado`, `sinopsis`, `url_vimeo`, `destacado`) VALUES
(1, 'A Prueba de Ciencia', 2, 1, 3, 26, 1, 1, 'Todos los días, hombres y mujeres anónimos altamente formados, trabajan y ponen a prueba tanto materiales como procesos industriales y tecnológicos, que mejoran la calidad de vida de las personas: ¿Cómo criar un gusano para fabricar seda? - ¿Cómo lograr vidrios resistentes al fuego? A Prueba de Ciencia, un programa que desde la intimidad del Instituto Nacional de Tecnología Industrial (INTI), nos permitirá conocer el trabajo que los investigadores llevan a cabo, con experimentos de laboratorio, pruebas y ensayos que no imaginamos.', '128250076', 1),
(2, 'Desafios en el CEP', 5, 2, 10, 26, 1, 1, '¿es posible obtener una membrana de una botella de PeT? ¿Hacer un piso de tapitas de gaseosas? ¿Construir ventanas con cubiertas en desuso? Desafíos en el CeP se propone en cada episodio construir un elemento o \r\ndispositivo nuevo, usando materiales de desecho. Convertimos al Centro experimental de la Producción de la Facultad de Arquitectura y urbanismo de la universidad de Buenos Aires en un set de televisión. Y al arquitecto Carlos Levinton en el conductor de esta propuesta, que lejos de ser académica, nos demuestra de una forma descontracturada y lúdica que podemos transformar todo aquello que parece basura.', '127856574', 0),
(3, 'El Trabajo y Yo', 3, 3, 1, 26, 1, 1, 'Hay personas tan apasionadas por lo que hacen que su trabajo los identifica. ¿Su manera de ser los llevó a elegir su oficio o su oficio influye en su manera de ser? Este ciclo indaga en las cuestiones del trabajo que siguen activas aún cuando termina el horario laboral. En el vínculo estrecho entre vida y profesión.', '93148919', 0),
(4, 'Fabrica de Jabones', 4, 5, 5, 13, 2, 1, 'Cotidianamente, todos utilizamos productos de los cuales desconocemos su proceso de fabricación. En Industria Argentina, mostraremos todas las etapas del proceso de fabricación de distintos productos nacionales. Desde la materia prima utilizada hasta el resultado final, toda la cadena de producción es explicada por los responsables de cada área. Industria Argentina, un programa de producción nacional que refleja el trabajo argentino, su calidad, historia y proyección.', '127182898', 0),
(5, 'Quijotes del Medioambiente', 5, 4, 9, 26, 1, 0, 'Cuando todos pensaban que era una locura, "ellos" creyeron en sus proyectos y los hicieron realidad. Los "Quijotes del Medio Ambiente" son personas comprometidas con el desarrollo sustentable y el cuidado del plantea, que diseñan y proyectan soluciones innovadoras para una vida saludable. En cada capitulo, estos personajes con cuentan el origen de cada proyecto, las reacciones del entorno que los trato de "locos" y las frustraciones y logros que fueron cosechando a lo largo del camino. Quijotes del Medio Ambiente, una radiografía de la lucha contra los modernos "molinos de viento".', '127960225', 1),
(6, 'Vecinas en Clase', 1, 2, 6, 13, 1, 1, 'Son mujeres.  Quieren aprender, quieren trabajar, quieren ser protagonistas.  Vecinas en Clase muestra los talleres de capacitación en “refacciones y prevención de riesgos en el hogar”.  Un proyecto llevado a cabo por la Fundación Uocra que  pretende formar a más de 200 mujeres de seis barrios vulnerables. Vecinas en Clase acompaña a ésas mujeres que deciden formarse en ámbitos tradicionalmente ocupados por varones: mujeres que aprenden a revocar, mujeres que intentan levantar paredes, mujeres que estudian electricidad… Mujeres que comparten con sus amigas y vecinas sus ansias desbordantes de progresar.  Mujeres que avanzan en oficios masculinos… Mujeres que cambian la historia.', '127828591', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
`id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `locked` tinyint(1) NOT NULL,
  `expired` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  `confirmation_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `credentials_expired` tinyint(1) NOT NULL,
  `credentials_expire_at` datetime DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=15 ;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `locked`, `expired`, `expires_at`, `confirmation_token`, `password_requested_at`, `roles`, `credentials_expired`, `credentials_expire_at`) VALUES
(1, 'ajam28d', 'ajam28d', 'aj.alabarce@gmail.com', 'aj.alabarce@gmail.com', 1, '47lik9u8876sw8oko4k0o4o040kw880', 'kELMHrzIaY7rX9wkU88ZuYchHYO+fDN0B5/ruN0uYcG4TsACc1DjqwWEgCul+2pND4teAqYFrgcEgm1SZ8zRQg==', '2015-04-24 05:36:46', 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(2, 'aguala', 'aguala', 'agus@test.com', 'agus@test.com', 1, 'nphe3k1w4e8w80gowgo08cgw0gc48o0', '2RTQgCa4qdlZeudD0RukOf8u9GZ2r8WcBikHHwWTUq4A7Yg154CSRaHoDMI81V2orV0y/6AZN2/GwjFFgwE3LQ==', '2015-04-25 01:58:16', 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(4, 'freddy', 'freddy', 'alfre@ju.com', 'alfre@ju.com', 1, '3r2386cgk4is4go84040koowck0kk0s', 'NxO2R8smlF6WuSDkPTK9mXiZFXDls4v7Yqr6ZdDjJuGpDNQby7AQrjG27sFpCC5bv5v/giVH4zV3W9jvb+XGiQ==', '2015-04-29 00:40:41', 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(5, 'martoh93', 'martoh93', 'martin@asd.com', 'martin@asd.com', 1, '5h6vs2lf3mccgk4wkkg0c8w48skck4w', '7SSCvnF1g++9MXW3B/6Vbyzz8jvwREbgUFAdip4mH7jVqIWDZRvum3vyzyb5XKkQtd+SHz0oMvZ2jQIUEk8C5Q==', '2015-05-12 14:06:12', 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(6, 'asd', 'asd', 'asd@asd.com', 'asd@asd.com', 1, 'rm7mq9jka5wckckow40cwg08sskg0k8', 'eQN2Miak7gED9ztIClAYkFfhmvhlQ2boRPTLAQZ3HWoqXju9delwwsQ1DPlR6u0Vgr4VAaGSYmbAStZejko4hg==', '2015-05-12 19:35:38', 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(7, 'weerrt', 'weerrt', 'qwerty@qqq.com', 'qwerty@qqq.com', 1, 'a2wkvcolhiosw0gk0g4sog0okckw40c', '+T7COoG3UxqpunjX14TtdOL6IixoyOdZF5ObvIyRWnpLnhtMpfje2gbY16HR8iYayIDGLTNxQKMve5vEV2or4Q==', '2015-05-13 14:32:17', 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(8, 'oka', 'oka', 'last@tri.com', 'last@tri.com', 1, '1edzz8enjysk44w4kc08gcgos84w04s', 'kEsUCplrwfiO+EuX3fImSYmvH/jxaWjyoUl8ZVLuko7O6XkFe3avfoD3dHqEIHWgR7EyHO6s3CBZGXt2TxXkkg==', '2015-05-13 14:34:07', 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(9, 'freddy@', 'freddy@', 'asd@a.com', 'asd@a.com', 1, 'c19ibxpouu8kkoc48kw80gs4o0oo8sc', 'yY5yt585sfqwAw1xLLVuvPQpnbVDuE2XgnQLNXh/54S8A/JS7859qUvThHMIJOFiY/PqSm61GxuBHnRDYbA+WA==', '2015-05-14 12:13:00', 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(10, 'omg', 'omg', '123@asd.ocm', '123@asd.ocm', 1, 'f16spmihp68scgo4c8cg84gk00004cs', 'MNzHrTku5Wad/jiHcdCRmHnJNpvqW6nC52gGlV83n5kt3T5WMDV/Ok64MbEUmgZ1UEzAJ4L/7Q5GVyVKzlN5tQ==', '2015-05-14 12:37:17', 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(11, 'reeeee', 'reeeee', '123@123.com', '123@123.com', 1, 'tnh5oz2fabk008gswk4cso04g80gwkw', 'VJIKKrSigWzUfg7ndZfuAu20UPewuPortP34i3R3BPZEqTxwzP+IxEOQdI1ddENk7C2WEcmINH+EnS5N72nIxA==', '2015-05-14 12:38:23', 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(12, 'gaga', 'gaga', 'asd@asd.comd', 'asd@asd.comd', 1, '2jan0hhw3a04cwcgks8k4g4k0o804ww', '77kGy1k+r4vFURqQOSdWiU3n+RceHf0g3BNSHVCc0RKLIV/qCI08JtP6QTWKgfofT3kHxVb+23yqgaRZNNBfXw==', '2015-05-14 12:41:31', 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(13, '4547665', '4547665', 'hfysghasgjashjk@hashiash.com', 'hfysghasgjashjk@hashiash.com', 1, 'kw45arrzh74cwowccs8wkcgw0go40oo', 'EuiLbQTn6El1uqEFLgrFv/0QtInY9m3x3ecY0PmbsDqgZPJddp01SDG9jwbvNKi5JtjUZ3qS8v+r7K3vnENcqA==', '2015-05-20 02:37:51', 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(14, 'suave', 'suave', 'asjfosajkdod@ahsiajso.com', 'asjfosajkdod@ahsiajso.com', 1, 'nhpd5shq43kwgwsg4kwgso048sg44s0', 'H/NaSipiEoKoMtclZLKDmjc+XpGtRiLhcdZYNQ6TJacsFG1I4CtHgo/Ccgzp+gXCZFGeAChliuGNfyksI6nxcw==', '2015-05-20 02:54:43', 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `accesstoken`
--
ALTER TABLE `accesstoken`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `UNIQ_B39617F55F37A13B` (`token`), ADD KEY `IDX_B39617F519EB6921` (`client_id`), ADD KEY `IDX_B39617F5A76ED395` (`user_id`);

--
-- Indices de la tabla `authcode`
--
ALTER TABLE `authcode`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `UNIQ_F1D7D1775F37A13B` (`token`), ADD KEY `IDX_F1D7D17719EB6921` (`client_id`), ADD KEY `IDX_F1D7D177A76ED395` (`user_id`);

--
-- Indices de la tabla `client`
--
ALTER TABLE `client`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `generos`
--
ALTER TABLE `generos`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `refreshtoken`
--
ALTER TABLE `refreshtoken`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `UNIQ_7142379E5F37A13B` (`token`), ADD KEY `IDX_7142379E19EB6921` (`client_id`), ADD KEY `IDX_7142379EA76ED395` (`user_id`);

--
-- Indices de la tabla `series`
--
ALTER TABLE `series`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `titulos`
--
ALTER TABLE `titulos`
 ADD PRIMARY KEY (`id`), ADD KEY `genero_id` (`genero_id`,`serie_id`), ADD KEY `serie_id` (`serie_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `UNIQ_EF687F292FC23A8` (`username_canonical`), ADD UNIQUE KEY `UNIQ_EF687F2A0D96FBF` (`email_canonical`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `accesstoken`
--
ALTER TABLE `accesstoken`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=94;
--
-- AUTO_INCREMENT de la tabla `authcode`
--
ALTER TABLE `authcode`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `client`
--
ALTER TABLE `client`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `generos`
--
ALTER TABLE `generos`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `refreshtoken`
--
ALTER TABLE `refreshtoken`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=76;
--
-- AUTO_INCREMENT de la tabla `series`
--
ALTER TABLE `series`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `titulos`
--
ALTER TABLE `titulos`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `accesstoken`
--
ALTER TABLE `accesstoken`
ADD CONSTRAINT `FK_B39617F519EB6921` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`),
ADD CONSTRAINT `FK_B39617F5A76ED395` FOREIGN KEY (`user_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `authcode`
--
ALTER TABLE `authcode`
ADD CONSTRAINT `FK_F1D7D17719EB6921` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`),
ADD CONSTRAINT `FK_F1D7D177A76ED395` FOREIGN KEY (`user_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `refreshtoken`
--
ALTER TABLE `refreshtoken`
ADD CONSTRAINT `FK_7142379E19EB6921` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`),
ADD CONSTRAINT `FK_7142379EA76ED395` FOREIGN KEY (`user_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `titulos`
--
ALTER TABLE `titulos`
ADD CONSTRAINT `titulos_ibfk_1` FOREIGN KEY (`genero_id`) REFERENCES `generos` (`id`),
ADD CONSTRAINT `titulos_ibfk_2` FOREIGN KEY (`serie_id`) REFERENCES `series` (`id`);
