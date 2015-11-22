-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 21, 2015 at 11:24 AM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `open-data-platform`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Economy'),
(2, 'Environment'),
(3, 'Population'),
(4, 'Transportation and Communication'),
(5, 'Public Finance'),
(6, 'Agriculture'),
(7, 'Employment'),
(8, 'Social Welfare'),
(9, 'Health'),
(10, 'Education'),
(11, 'Law and Justice'),
(12, 'Cultural'),
(13, 'Infrastructure'),
(14, 'Politics'),
(15, 'Energy');

-- --------------------------------------------------------

--
-- Table structure for table `dataset`
--

CREATE TABLE IF NOT EXISTS `dataset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `department` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=100 ;

--
-- Dumping data for table `dataset`
--

INSERT INTO `dataset` (`id`, `name`, `description`, `timestamp`, `department`, `category`) VALUES
(1, 'National Accounts 2015', 'This dataset contains the gross domestic product by industrial origin and by expenditure shares at current and constant 2000 prices. The Philippine System of National Accounts (PSNA) follows the 2008 SNA recommendations to the fullest extent possible.', '2015-11-21 11:00:00', 1, 1),
(2, 'Philippine Flow of Funds', 'This dataset contains the Philippine Flow of Funds presenting the summary matrix of financial transactions among the different institutions of the economy, and between these institutions and the rest of the world.  It identifies which institutions are net borrowers and net lenders during the year.  Institutions are categorized into four, namely: 1. financial corporations, 2. non-financial corporations, 3. the general government, and 4. the households.', '2015-11-21 11:00:00', 1, 1),
(3, 'Interbank Call Loan Rate 2015', 'This dataset contains the interest rates on interbank call loan facility. Interbank Call Loan Rate is the rate on loans among banks for periods not exceeding 24 hours primarily for the purpose of covering reserve deficiencies.', '2015-11-21 11:00:00', 1, 1),
(4, 'National Government Cash Operations', 'This dataset contains the National Government’s cash receipts from revenues, cash disbursements to defray authorized public expenditures, the resulting surplus or deficit, and the corresponding domestic and foreign financing to cover such surplus or deficit. Sources of Data: The National Government Cash Operations Report is being produced by the Bureau of the Treasury.', '2015-11-21 11:00:00', 1, 1),
(5, 'Consolidated Public Sector Financial Position', 'This dataset contains the combined financial positions of the National Government, monitored non-financial government corporations, government financial institutions, local government units, and social security institution. The dataset also includes the cost of restructuring the defunct Central Bank, financial position of the present Bangko Sentral ng Pilipinas and the Oil Price Stabilization Fund &#40;OPSF&#41; from 1998 to 2001. Sources of Data: The Consolidated Public Sector Financial Position is produced by the Department of Finance.', '2015-11-21 11:00:00', 1, 1),
(6, 'Banks with Electronic Banking Facilities', 'Number of banks with electronic banking facilities: 2008-2012', '2015-11-21 11:00:00', 1, 1),
(7, 'Philippine Peso Per US Dollar Exchange Rate 2015', 'This dataset contains the daily, monthly and annual average of Philippine Peso-US Dollar exchange rate. ', '2015-11-21 11:00:00', 1, 1),
(8, 'Foreign Currency Deposit Units: Loans by Borrower 2015', 'This dataset contains the outstanding foreign currency-denominated loans granted by FCDUs to various sectors of the economy. Scope and Classification: It is composed of data on outstanding loans granted by FCDUs by type of borrower &#40;i.e., merchandise/service exporters, producers/manufacturers, oil companies, public utilities&#41;. Sources of Data and Methodology: Data are mainly sourced from the International Operations Department &#40;IOD&#41; and are reported in US Dollars.', '2015-11-21 11:00:00', 1, 1),
(9, 'Overseas Filipino Remittance 2015', 'This dataset contains the overseas Filipinos’ cash and personal remittances. Statistics on cash remittances are based on reports submitted by banks and are classified by country of source and by type of worker.', '2015-11-21 11:00:00', 1, 1),
(10, 'Waterbody Stations Sampling Results', 'This dataset contains sampling results of waterbody stations.', '2015-11-21 11:15:00', 2, 2),
(11, 'WaterBody Stations ', 'This dataset contains a list of waterbody stations for Paranaque River and Navotas-Malabon-Tullahan-Tenejeros River.', '2015-11-21 11:15:00', 2, 2),
(12, 'Average Domestic Price of Wood Panel 2004-2013 ', 'This dataset contains the average domestic price of wood panel board for the year 2004-2013.', '2015-11-21 11:15:00', 3, 2),
(13, 'Average Domestic Price of Lumber 2003-2013 ', 'This dataset contains the average domestic price lumber imported and price lumber local from the year 2003 to 2013.', '2015-11-21 11:15:00', 3, 2),
(14, 'Community - Based Forest Management Agreement 2012 ', 'This dataset contains the community-based forest management agreements for the year 2012.', '2015-11-21 11:15:00', 3, 2),
(15, 'Quarterly Domestic Prices of Locally Produced Logs and Naturally Planted 2012 ', 'This dataset contains the quarterly domestic prices of locally produced logs and naturally grown for the year 2012.', '2015-11-21 11:15:00', 3, 2),
(16, 'Quarterly Domestic Domestic Prices of Locally Produced Logs and Planted 2012 ', 'This dataset contains the quarterly domestic prices of locally produced logs, planted for the year 2012.', '2015-11-21 11:15:00', 3, 2),
(17, 'Forest Land Grazing Management Agreement by Province 2012 ', 'This dataset contains the forest land grazing management agreements by province for the year 2012.', '2015-11-21 11:15:00', 3, 2),
(18, 'Integrated Forest Management Agreement 2012 ', 'This dataset contains the integrated forest management agreement by province for the year 2012. ', '2015-11-21 11:15:00', 3, 2),
(19, 'Au Pair Information System', 'This information system is used to register Au Pair Visa Holders going to Europe. The system generates demographic profile of registered Filipinos leaving the Philippines as Au Pairs. Demographic Profile of Au Pair Visa Holder Abroad $#40;classified by country of destination, age, sex, civil status, educational background, place of origin in the Philippines, occupational group, mode of introduction to the host family$#41;.', '2015-11-21 11:20:00', 4, 3),
(20, 'Lingkod sa Kapwa Filipino $#40;LinKaPil$#41; Information System', 'The system/database is designed to facilitate the transfer of various forms of assistance from overseas Filipinos or other overseas donors to support projects in livelihood development, education, health and welfare, small-scale infrastructure, and technology and skills transfer in the country. Also it acts as monitoring system fro projects and donation status. Demographic data on donations and projects from overseas Filipinos up to the provincial level.', '2015-11-21 11:20:00', 4, 3),
(21, 'Community-Based Monitoring System - 2008 Core Indicators in Romblon', 'This dataset contains barangay-level information on the 14 core indicators, including demography, of CBMS in the province of Romblon. These 14 indicators are: &#40;1&#41; malnourished children 0 to 5 years old; &#40;2&#41; death of children 0 to 5 years old; &#40;3&#41; death of women due to pregnancy-related causes; &#40;4&#41; households without access to safe water; &#40;5&#41; households without access to sanitary toilet facilities; &#40;6&#41; households living in makeshift housing; &#40;7&#41; households who are informal settlers; &#40;8&#41; children aged 6 to 12 not attending elementary school; &#40;9&#41; children aged 13 to 16 not attending secondary school; &#40;10&#41; children aged 6 to 16 not attending school; &#40;11&#41; population who are unemployed; &#40;12&#41; households with income below poverty threshold; &#40;13&#41; households with income below food threshold; and &#40;14&#41; households who experienced food shortage. The data shows magnitude and proportion per barangay in each indicator; magnitude refers to the actual count of individuals/households in a given sample of the population while proportion refers to the percentage of the magnitude relative to the total count in a given sample of the population.', '2015-11-21 11:20:00', 5, 3),
(22, 'Community-Based Monitoring System - 2008 Core Indicators in La Union', 'his dataset contains barangay-level information on the 14 core indicators, including demography, of CBMS in the province of La Union municipality of Burgos. These 14 indicators are: &#40;1&#41; malnourished children 0 to 5 years old; &#40;2&#41; death of children 0 to 5 years old; &#40;3&#41; death of women due to pregnancy-related causes; &#40;4&#41; households without access to safe water; &#40;5&#41; households without access to sanitary toilet facilities; &#40;6&#41; households living in makeshift housing; &#40;7&#41; households who are informal settlers; &#40;8&#41; children aged 6 to 12 not attending elementary school; &#40;9&#41; children aged 13 to 16 not attending secondary school; &#40;10&#41; children aged 6 to 16 not attending school; &#40;11&#41; population who are unemployed; &#40;12&#41; households with income below poverty threshold; &#40;13&#41; households with income below food threshold; and &#40;14&#41; households who experienced food shortage. The data shows magnitude and proportion per barangay in each indicator; magnitude refers to the actual count of individuals/households in a given sample of the population while proportion refers to the percentage of the magnitude relative to the total count in a given sample of the population.', '2015-11-21 11:20:00', 5, 3),
(23, 'Community-Based Monitoring System - 2008 Core Indicators in Camarines Norte', 'This dataset contains barangay-level information on the 14 core indicators, including demography, of CBMS in the province of Camarines Norte. These 14 indicators are: &#40;1&#41; malnourished children 0 to 5 years old; &#40;2&#41; death of children 0 to 5 years old; &#40;3&#41; death of women due to pregnancy-related causes; &#40;4&#41; households without access to safe water; &#40;5&#41; households without access to sanitary toilet facilities; &#40;6&#41; households living in makeshift housing; &#40;7&#41; households who are informal settlers; &#40;8&#41; children aged 6 to 12 not attending elementary school; &#40;9&#41; children aged 13 to 16 not attending secondary school; &#40;10&#41; children aged 6 to 16 not attending school; &#40;11&#41; population who are unemployed; &#40;12&#41; households with income below poverty threshold; &#40;13&#41; households with income below food threshold; and &#40;14&#41; households who experienced food shortage. The data shows magnitude and proportion per barangay in each indicator; magnitude refers to the actual count of individuals/households in a given sample of the population while proportion refers to the percentage of the magnitude relative to the total count in a given sample of the population.', '2015-11-21 11:20:00', 5, 3),
(24, 'Community-Based Monitoring System - 2008 Core Indicators in Occidental Mindoro', 'This dataset contains barangay-level information on the 14 core indicators, including demography, of CBMS in the province of Occidental Mindoro. These 14 indicators are: &#40;1&#41; malnourished children 0 to 5 years old; &#40;2&#41; death of children 0 to 5 years old; &#40;3&#41; death of women due to pregnancy-related causes; &#40;4&#41; households without access to safe water; &#40;5&#41; households without access to sanitary toilet facilities; &#40;6&#41; households living in makeshift housing; &#40;7&#41; households who are informal settlers; &#40;8&#41; children aged 6 to 12 not attending elementary school; &#40;9&#41; children aged 13 to 16 not attending secondary school; &#40;10&#41; children aged 6 to 16 not attending school; &#40;11&#41; population who are unemployed; &#40;12&#41; households with income below poverty threshold; &#40;13&#41; households with income below food threshold; and &#40;14&#41; households who experienced food shortage. The data shows magnitude and proportion per barangay in each indicator; magnitude refers to the actual count of individuals/households in a given sample of the population while proportion refers to the percentage of the magnitude relative to the total count in a given sample of the population.', '2015-11-21 11:20:00', 5, 3),
(25, 'Community-Based Monitoring System - 2008 Core Indicators in Siquijor', 'This dataset contains barangay-level information on the 14 core indicators, including demography, of CBMS in the province of Siquijor. These 14 indicators are: &#40;1&#41; malnourished children 0 to 5 years old; &#40;2&#41; death of children 0 to 5 years old; &#40;3&#41; death of women due to pregnancy-related causes; &#40;4&#41; households without access to safe water; &#40;5&#41; households without access to sanitary toilet facilities; &#40;6&#41; households living in makeshift housing; &#40;7&#41; households who are informal settlers; &#40;8&#41; children aged 6 to 12 not attending elementary school; &#40;9&#41; children aged 13 to 16 not attending secondary school; &#40;10&#41; children aged 6 to 16 not attending school; &#40;11&#41; population who are unemployed; &#40;12&#41; households with income below poverty threshold; &#40;13&#41; households with income below food threshold; and &#40;14&#41; households who experienced food shortage. The data shows magnitude and proportion per barangay in each indicator; magnitude refers to the actual count of individuals/households in a given sample of the population while proportion refers to the percentage of the magnitude relative to the total count in a given sample of the population.', '2015-11-21 11:20:00', 5, 3),
(26, 'Community-Based Monitoring System - 2008 Core Indicators in Leyte', 'This dataset contains barangay-level information on the 14 core indicators, including demography, of CBMS in the province of Leyte. These 14 indicators are: &#40;1&#41; malnourished children 0 to 5 years old; &#40;2&#41; death of children 0 to 5 years old; &#40;3&#41; death of women due to pregnancy-related causes; &#40;4&#41; households without access to safe water; &#40;5&#41; households without access to sanitary toilet facilities; &#40;6&#41; households living in makeshift housing; &#40;7&#41; households who are informal settlers; &#40;8&#41; children aged 6 to 12 not attending elementary school; &#40;9&#41; children aged 13 to 16 not attending secondary school; &#40;10&#41; children aged 6 to 16 not attending school; &#40;11&#41; population who are unemployed; &#40;12&#41; households with income below poverty threshold; &#40;13&#41; households with income below food threshold; and &#40;14&#41; households who experienced food shortage. The data shows magnitude and proportion per barangay in each indicator; magnitude refers to the actual count of individuals/households in a given sample of the population while proportion refers to the percentage of the magnitude relative to the total count in a given sample of the population.', '2015-11-21 11:20:00', 5, 3),
(27, 'Community-Based Monitoring System - 2008 Core Indicators in Agusan del Norte', 'This dataset contains barangay-level information on the 14 core indicators, including demography, of CBMS in the province of Agusan Del Norte. These 14 indicators are: &#40;1&#41; malnourished children 0 to 5 years old; &#40;2&#41; death of children 0 to 5 years old; &#40;3&#41; death of women due to pregnancy-related causes; &#40;4&#41; households without access to safe water; &#40;5&#41; households without access to sanitary toilet facilities; &#40;6&#41; households living in makeshift housing; &#40;7&#41; households who are informal settlers; &#40;8&#41; children aged 6 to 12 not attending elementary school; &#40;9&#41; children aged 13 to 16 not attending secondary school; &#40;10&#41; children aged 6 to 16 not attending school; &#40;11&#41; population who are unemployed; &#40;12&#41; households with income below poverty threshold; &#40;13&#41; households with income below food threshold; and &#40;14&#41; households who experienced food shortage. The data shows magnitude and proportion per barangay in each indicator; magnitude refers to the actual count of individuals/households in a given sample of the population while proportion refers to the percentage of the magnitude relative to the total count in a given sample of the population.', '2015-11-21 11:20:00', 5, 3),
(28, 'Light Rail Transit Line 2 - Peak-Hour Trainsets Running 2009-2013', 'Contains monthly data on total number of trainsits running on line 2 during peak operation hour.', '2015-11-21 11:22:30', 6, 4),
(29, 'Air Traffic Data - Clark International Airport Corporation Fedex Flights Report', 'This dataset contains the monthly summary of inbound and outbound Fedex flights.', '2015-11-21 11:22:30', 6, 4),
(30, 'Light Rail Transit Line 1 - Peak-Hour Light Rail Vehicle Trips 2009-2013', 'Contains monthly data on total number of trips (one direction) travelled by all operational Light Rail Vehicles (LRVs, or coaches) on Line 1 during the peak operation hours.', '2015-11-21 11:22:30', 6, 4),
(31, 'Light Rail Transit Line 1 and Line 2 - Gross Revenue Collection in Php Million 2009 to 2013', 'Contains gross revenue per month of the Light Rail Transit Authority (LRTA) from line 1 operation and line 2 operation.', '2015-11-21 11:22:30', 6, 4),
(32, 'Light Rail Transit Line 1 and Line 2 - Safety Incidents 2004-2014', 'This dataset contains the annual number of safety incidents that occurred in Light Rail Transit (LRT) Line 1 and Line 2.', '2015-11-21 11:22:30', 6, 4),
(33, 'Registered Motor Vehicles by Classification and Region 2010-2013', 'This dataset contains the annual number of registered motor vehicles from 2010 to 2013, classified according to use (i.e., Private, For Hire, Government, Diplomatic, and Tax-Exempt), vehicle type (i.e., Cars, UV, SUV, Trucks, Motorcycles/Tricycles, and Trailers), and region.', '2015-11-21 11:22:30', 6, 4),
(34, 'Philippine National Railways - Monthly Passenger Traffic per Station 2014', 'This data set contains the monthly number of passengers of Philippine National Railways (PNR) in 2014.', '2015-11-21 11:22:30', 6, 4),
(35, 'Light Rail Transit Line 1 and Line 2 - Fare Box Ratio 2009 to 2013', 'Contains monthly data on fare revenue over operation expense (excludes interest/financial charges, depreciation, and amortization of capitalized cost – i.e., development, pre-operating).', '2015-11-21 11:22:30', 6, 4),
(36, 'Light Rail Transit Line 1 and Line 2 - Peak-Hour Load Factor 2009-2013', 'Contains monthly data on percentage of actual number of passengers over the rated capacity of the train at peak hour.', '2015-11-21 11:22:30', 6, 4),
(37, 'PhilGEPS Public Data', 'Contains all data for the PhilGEPS Public Tables API Project.', '2015-11-21 11:25:00', 7, 5),
(38, 'Comparative Internal Revenue Collections and Goals by Implementing Office', 'Cumulative Collections and Goals by RR''s Notes: 1. Goal based on RMO No. 1-2013, 2. CY 2013 collection based on 1209 reports as of May 26, 2014, Prepared by: Research and Statistics Division.', '2015-11-21 11:25:00', 9, 5),
(39, 'National Expenditure Program FY 2015 - Proposed-Automatic', 'National Expenditure Program $#40;NEP$#41; Fiscal Year 2015 - Proposed-Automatic $#40;2015$#41;', '2015-11-21 11:25:00', 8, 5),
(40, 'National Expenditure Program FY 2015 - Proposed', 'National Expenditure Program $#40;NEP$#41; Fiscal Year 2015 - Proposed $#40;2015$#41;', '2015-11-21 11:25:00', 8, 5),
(41, 'National Expenditure Program FY 2015 - Adjusted-Automatic', 'National Expenditure Program $#40;NEP$#41; Fiscal Year 2015 - Adjusted-Automatic $#40;2014$#41;', '2015-11-21 11:25:00', 8, 5),
(42, 'National Expenditure Program FY 2015 - Actual', 'National Expenditure Program $#40;NEP$#41; Fiscal Year 2015 - Actual $#40;2013$#41;', '2015-11-21 11:25:00', 8, 5),
(43, 'National Expenditure Program FY 2015 - Actual-Automatic', 'National Expenditure Program $#40;NEP$#41; Fiscal Year 2015 - Actual-Automatic $#40;2013$#41;', '2015-11-21 11:25:00', 8, 5),
(44, 'General Appropriations Act $#40;Automatic Appropriations$#41; 2010', 'Approved National Budget for 2010', '2015-11-21 11:25:00', 8, 5),
(45, 'General Appropriations Act $#40;Automatic Appropriations$#41; 2009', 'Approved National Budget for 2009', '2015-11-21 11:25:00', 8, 5),
(46, 'Banana Packaging Facilites', 'Directory of Banana packaging facilities.', '2015-11-21 11:27:30', 10, 6),
(47, 'Market Prices', 'Prevailing market prices of agricultural commodities from the different selected markets.', '2015-11-21 11:27:30', 10, 6),
(48, 'Barangay Food Terminals', 'Directory of Barangay Food Terminals.', '2015-11-21 11:27:30', 10, 6),
(49, 'Dairy Farmers Association', 'Directory of Dairy Farmers Association.', '2015-11-21 11:27:30', 10, 6),
(50, 'Agribusiness Firms', 'List of Suppliers and Buyers of Agriculture and Fishery commodities.', '2015-11-21 11:27:30', 10, 6),
(51, 'Plant Nursery Operators', 'Directory of Plant Nursery Operators.', '2015-11-21 11:27:30', 10, 6),
(52, 'Sugar Confederation', 'Directory of Sugar Planters Confederation.', '2015-11-21 11:27:30', 10, 6),
(53, 'Plant Quarantine Ports', 'Location of the different Plant Quarantine Ports.', '2015-11-21 11:27:30', 10, 6),
(54, 'Sugar Millers', 'Directory of Sugar Planters Confederation.', '2015-11-21 11:27:30', 10, 6),
(55, 'Deployed Overseas Filipino Workers by Country of Destination', 'This dataset contains the number of deployed Overseas Filipino Workers (OFWs) by country of destination categorized as land-based and sea-based from 2008 to 2012.', '2015-11-21 11:30:00', 11, 7),
(56, 'Benefits and Services for Overseas Filipino Workers', 'This dataset contains the different kinds of benefits and services provided by the Overseas Workers Welfare Administration to the Overseas Filipino Workers from 2008 to 2012.', '2015-11-21 11:30:00', 11, 7),
(57, 'Deployed Overseas Filipino Workers Land Based and Sea Based', 'This dataset contains the number of deployed Overseas Filipino Workers (OFWs) categorized as Land-based and Sea-based from 1984-2012.', '2015-11-21 11:30:00', 11, 7),
(58, 'Enrollment and Graduates of Technical Vocational Education and Training by Region', 'This dataset contains the number of enrollment and graduates of school-based and non-school based TVET programs of the Technical Education and Skills Development Authority from 2008 to 2012.', '2015-11-21 11:30:00', 11, 7),
(59, 'Establishments Inspected and Found Violating General Labor Standards and Technical Safety Standards', 'This dataset contains the number of establishments inspected by the labor inspectors from the DOLE Regional Offices to determine compliance to General Labor Standards (e.g., on wages, hours of work, etc.); and to the number of establishments visited by those inspectors to inspect mechnical units (e.g., boiler, pressure, vessel, internal combustion engine, elevator, hoisting equipment, and electrical installation) as to technical safety. It also includes data on the number of establishments/units with violations corrected on field; workers benefited; and amount of restitutions. The dataset is compiled by the Bureau of Working Conditions. It covers the period 1976 to 2012. Notes: 1. Regular inspections were suspended per memo circular dated August 14, 1979. Data from thereon were based on complaints.', '2015-11-21 11:30:00', 11, 7),
(60, 'Existing Collective Bargaining Agreements in the Private Sector', 'This dataset contains the number and workers covered by Collective Bargaining Agreements in the private sector from 1963-2012. Note: NA- Not Available; year 2010 to 2011- Pleminary.', '2015-11-21 11:30:00', 11, 7),
(61, 'Status of Illegal Recruitment Cases', 'This dataset contains the status of illegal recruitment cases handled by the Philippine Overseas Employment Administration from 2007-2011.', '2015-11-21 11:30:00', 11, 7),
(62, 'Number and Membership to Existing Labor Organizations by Type of Labor Organization', 'This dataset contains the number and membership of existing labor organizations in the Philippines classified by type of labor organization from 1980 to 2012. Note: Note: Starting 2002, membership of local/independent unions includes membership of federations/labor centers.', '2015-11-21 11:30:00', 11, 7),
(63, 'Trainees Served and Certificates Issued by the National Maritime Polytechnic', 'This dataset contains the number of trainees served and number of certificate issued by the National Maritime Polytechnic from 1986 to 2012.', '2015-11-21 11:30:00', 11, 7),
(64, 'Pantawid Pamilyang Pilipino Program', 'Number of Pantawid Pamilya Household Beneficiaries by Set, Total Number of Target Households and Total Amount of Cash Grants Received by Region, Province, Congressional District and City/Municipality.', '2015-11-21 11:35:00', 12, 8),
(65, 'Supplementary Feeding Program', 'Area Coverage, Number of Beneficiaries and Total Amount of Assistance by Region, Province, District, and City/Municipality.', '2015-11-21 11:35:00', 12, 8),
(66, 'Sustainable Livelihood Program Monthly Accomplishment Report', 'Area Coverage, Number of Beneficiaries and Total Amount of Assistance by Region, Province, District, and City/Municipality.', '2015-11-21 11:35:00', 12, 8),
(67, 'Number of Households Assessed and Identified Poor Households', 'Number of Households Assessed and Identified Poor Households - Database Instance as if July 1, 2011.', '2015-11-21 11:35:00', 12, 8),
(68, 'Social Pension Program Accomplishment Report', 'Area Coverage, Number of Beneficiaries and Total Amount of Assistance by Region, Province, District, and City/Municipality.', '2015-11-21 11:35:00', 12, 8),
(69, 'Core Shelter, Cash for Work for IDPs, and Disaster Relief Report 2014', 'Number of Beneficiaries and Total Amount of Assistance Per Program (Core Shelter, Cash for Work, Disaster Relief).', '2015-11-21 11:35:00', 12, 8),
(70, 'Status of Foreign Grants, Receipts Disbursements, and Balances', 'Status of Foreign Grants Receipts, Disbursements, and Balances (In PhP).', '2015-11-21 11:35:00', 12, 8),
(71, 'Kapit-Bisig Laban sa Kahirapan - Comprehensive and Integrated Delivery of Social Services - National Community-Driven Development Program Report', 'List of KALAHI-CIDSS Subprojects (Additional Financing and Millennium Challenge Corporation).', '2015-11-21 11:35:00', 12, 8),
(72, 'DSWD - National Household Targeting System', 'DSWD - National Household Targeting System, As of July 1, 2011', '2015-11-21 11:35:00', 12, 8),
(73, 'National Health Insurance Program Benefit Payments', 'This dataset contains membership benefit payments of National Health Insurance Program for the year 2010-2013. Note: amount in millions.', '2015-11-21 11:40:00', 13, 9),
(74, 'National Health Insurance Program Coverage', 'This dataset contains the projected population covered by the program.', '2015-11-21 11:40:00', 13, 9),
(75, 'Field Health Services Information System Indicators', 'This contains dataset on selected health indicators reported through the routine health information system of the DOH. Service delivery indicators and mortality and morbidity data are available in the dataset and summarized at the national and regional levels.', '2015-11-21 11:40:00', 14, 9),
(76, 'HIV Treatment Hubs', 'This dataset contains a list of all HIV treatment hubs for people living with HIV including pregnant women.', '2015-11-21 11:40:00', 14, 9),
(77, 'Social Hygiene Clinic in the Country', 'This dataset contains a list of all social hygiene clinic in the country.', '2015-11-21 11:40:00', 14, 9),
(78, 'Male and Female Enrollees in Public Elementary School and Public Secondary School 2012-2013', 'This dataset contains the male and female enrollees in public elementary schools and public secondary school for the year 2012 to 2013.', '2015-11-21 11:42:30', 16, 10),
(79, 'Enrollment Data of Elementary and Secondary 2012', 'This dataset contains the data enrollment of elementary and secondary for the year 2012.', '2015-11-21 11:42:30', 16, 10),
(80, 'Total School Enrollment for Public Elementary Schools and Public Secondary Schools 2005-2012', 'This dataset contains the total school enrollment for public elementary schools and public secondary school for the year 2005 to 2012.', '2015-11-21 11:42:30', 16, 10),
(81, 'Teacher Salaries 1995-2012', 'This dataset contains the teacher salaries for the year 1995 to 2012.', '2015-11-21 11:42:30', 16, 10),
(82, 'State Universities and Colleges', 'Information on State Universities and Colleges (SUCs).', '2015-11-21 11:42:30', 17, 10),
(83, 'Higher Education Institutions', 'Information on Higher Education Institutions (HEI), including private HEIs.', '2015-11-21 11:42:30', 17, 10),
(84, 'Gross Enrollment Ratio and Net Enrollment Ratio for Public Elementary Schools 2005-2011', 'This dataset contains the gross enrollment ratio and net enrollment ratio for public elementary schools for the year 2005 to 2011.', '2015-11-21 11:42:30', 16, 10),
(85, 'National Crime Statistics 2013', 'Statistics on all crime incidents referred, processed and gathered by the reporting Police Office and Other Law Enforcement Agencies for the year 2013.', '2015-11-21 11:45:00', 18, 11),
(86, 'Probation Caseload', 'This dataset contains probation supervision caseload and probation investigation caseload from 1978-2013.', '2015-11-21 11:45:00', 19, 11),
(87, 'Parole Supervision Caseload', 'This dataset contains the total parole supervision caseload from 1989-2013.', '2015-11-21 11:45:00', 19, 11),
(88, 'Pardon Supervision Caseload', 'This dataset contains the total pardon supervision caseload from 1989 to 2013.', '2015-11-21 11:45:00', 19, 11),
(89, 'Recapitulation on Incident involving Motorcycle Riding Criminals 2011-2013', 'This datasets contain the shooting incidents, robbery and carnapping for the year 2011 to 2013', '2015-11-21 11:45:00', 18, 11),
(90, 'TOURISM SATELLITE ACCOUNTS - 2010 TO 2012', 'Tourism Satellite Accounts from 2010 to 2012', '2015-11-21 11:50:00', 20, 12),
(91, 'VISITOR ARRIVALS BY SUBCONTINENT OF RESIDENCE - 1996 TO 2013', 'Visitor Arrivals by Subcontinent of Residence from 1996 to 2013', '2015-11-21 11:50:00', 20, 12),
(92, 'Number of Tourism Establishment and Rooms', 'Number of establishment and rooms by region, province and city for the year 2012.', '2015-11-21 11:50:00', 21, 12),
(93, 'Distribution of Regional Travellers in the Philippines', 'This datasets contain distribution of travels outside the country by foreign travelers, overseas filipino and domestic travelers for the year 2012.', '2015-11-21 11:50:00', 21, 12),
(94, 'Major Capital Programs and Projects Approved by the ICC/NEDA Board', 'List of major capital programs and projects approved by the Investment Coordination Committee and the NEDA Board.', '2015-11-21 11:52:30', 22, 13),
(95, 'Generated Are of National and Communal Irrigation Systems / Projects 1996 to 2012', 'Generated Area of National and Communal Irrigation Systems/Projects from 1996 to 2012', '2015-11-21 11:52:30', 20, 13),
(96, 'Infrastructure Project Status', 'The electronic Project Life Cycle $#40;ePLC $#41; is the operational system for the reporting of project information and monitoring the progress of implementation of infrastructure projects. ', '2015-11-21 11:52:30', 23, 13),
(97, 'Number of Registered Voters by Region', 'This dataset contains the number of registered voters, voters who actually voted and percentage of voting by region.', '2015-11-21 11:55:00', 24, 14),
(98, 'Presidents'' Foreign Trips', 'Foreign trips of the different Presidents of the Philippines.', '2015-11-21 11:55:00', 25, 14),
(99, 'Electric Energy Consumption by Sector - 1993 to 2011', 'Electric Energy Consumption by Sector from 1993 to 2011', '2015-11-21 11:55:00', 20, 15);

-- --------------------------------------------------------

--
-- Table structure for table `dataset-tag`
--

CREATE TABLE IF NOT EXISTS `dataset-tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dataset` int(11) NOT NULL,
  `tag` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE IF NOT EXISTS `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `name`) VALUES
(1, 'Bangko Sentral ng Pilipinas'),
(2, 'Environmental Management Bureau'),
(3, 'Department of Environment and Natural Resources'),
(4, 'Commission on Filipinos Overseas'),
(5, 'National Anti-Poverty Commission'),
(6, 'Department of Transportation and Communications'),
(7, 'Philippine Government Electronic Procurement System'),
(8, 'Department of Budget and Management'),
(9, 'Bureau of Internal Revenue'),
(10, 'Department of Agriculture'),
(11, 'Department of Labor and Employment'),
(12, 'Department of Social Works and Development'),
(13, 'Philippine Health Insurance Corporation'),
(14, 'Department of Health'),
(16, 'Department of Education'),
(17, 'Commission on Higher Education'),
(18, 'Philippine National Police'),
(19, 'Parole and Probation Administration'),
(20, 'Philippine Statistics Authority'),
(21, 'Department of Tourism'),
(22, 'National Economic and Development Authority'),
(23, 'Department of Public Works and Highways'),
(24, 'Commission on Elections'),
(25, 'Office of the President');

-- --------------------------------------------------------

--
-- Table structure for table `format`
--

CREATE TABLE IF NOT EXISTS `format` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `format`
--

INSERT INTO `format` (`id`, `name`) VALUES
(1, 'Line Graph'),
(2, 'Bar Graph'),
(3, 'Table');

-- --------------------------------------------------------

--
-- Table structure for table `resource`
--

CREATE TABLE IF NOT EXISTS `resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `format` int(11) NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dataset` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `resource`
--

INSERT INTO `resource` (`id`, `name`, `description`, `format`, `timestamp`, `dataset`) VALUES
(1, 'Quarterly Gross National Income By Industrial Origin', 'Quarterly Gross National Income By Industrial Origin', 1, '2015-11-21 14:09:37', 1),
(2, 'Amvel Creek Waterbody Sampling Results', 'Sampling results of BOD (5-Day 20 Degrees), Total Suspended Solids, Oil/Grease (Petroleum Ether Extracts), Phosphate as Phosphorus, and Nitrate as Nitrogen tests from the Amvel Creek Waterbody', 1, '2015-11-21 14:36:48', 10),
(3, 'Au Pair Visa Holder Abroad by Occupation 2012', 'Au Pair visa holders working abroad during 2012 sorted by occupation', 2, '2015-11-21 14:46:26', 19),
(4, 'Light Rail Transit Line 2 - Peak-Hour Trainsets Running.json', 'Monthly data on total number of transits running on LRT line 2 during peak operation hour.', 1, '2015-11-21 14:55:22', 28),
(5, 'Comparative Internal Revenue Collections and Goals 2013', 'Internal revenue collections and goals of the various implementing offices during 2013', 2, '2015-11-21 15:26:03', 38),
(6, 'Market Prices', 'Market prices of various commodities', 3, '2015-11-21 16:30:54', 47),
(7, 'Deployed Overseas Filipino Workers', 'Deployed Overseas Filipino Workers Land Based and Sea Based ', 1, '2015-11-21 17:01:49', 57),
(8, 'Ilocos Region', 'Amount of poor houselholds in the Ilocos Region', 2, '2015-11-21 17:45:24', 72);

-- --------------------------------------------------------

--
-- Table structure for table `resource-tag`
--

CREATE TABLE IF NOT EXISTS `resource-tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource` int(11) NOT NULL,
  `tag` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE IF NOT EXISTS `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
