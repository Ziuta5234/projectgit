-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 04, 2025 at 12:18 PM
-- Wersja serwera: 10.4.28-MariaDB
-- Wersja PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Trainly`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `karnety`
--

CREATE TABLE `karnety` (
  `ID` int(11) NOT NULL,
  `imie` varchar(30) NOT NULL,
  `nazwisko` varchar(35) NOT NULL,
  `email` varchar(50) NOT NULL,
  `id_karnetu` int(11) NOT NULL,
  `data_kupna` date NOT NULL,
  `data_odnowienia` date NOT NULL,
  `status` varchar(20) NOT NULL,
  `trener` varchar(50) NOT NULL,
  `stan_konta` decimal(10,0) NOT NULL,
  `ostatnie_wejscie` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `karnety`
--

INSERT INTO `karnety` (`ID`, `imie`, `nazwisko`, `email`, `id_karnetu`, `data_kupna`, `data_odnowienia`, `status`, `trener`, `stan_konta`, `ostatnie_wejscie`) VALUES
(1, 'Olaf', 'Puchała', 'olafpuchala@o2.pl', 126358731, '2025-11-09', '2025-12-09', 'Aktywny', 'Paweł Goniak', 20, '2025-11-18 08:23:50'),
(3, 'Kamil', 'Ayotalumuo', 'ayogavo@wp.pl', 1298341, '2025-11-02', '2025-12-02', 'Zamrożony', 'Paweł Goniak', 13, '2025-11-18 11:22:42');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password_hash`, `name`, `created_at`) VALUES
(1, 'domino@gmail.com', '$2y$10$DnOd8l6NVyNv4bY6HMGQcO2NU7wvH.vJdI/PV3EVsuwR.fY7k3bFa', 'domino', '2025-11-13 12:06:37'),
(2, 'kamil@cos.pl', '$2y$10$fHvbIJF8Hj.EMUmSLuageOqDXaG583UtoaaHRZL39mfgJN97SWmJG', 'kamil', '2025-11-13 12:07:28'),
(3, 'olafpuchala@o2.pl', '$2y$10$vtAL.stFud7..fKElty5luq.DVDAaJsHxHH6agyomrVcvFztoFaV.', 'Olaff', '2025-11-25 11:08:29');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
