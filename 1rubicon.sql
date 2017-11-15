-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 11, 2017 at 11:01 AM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rubicon`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `cu_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `com_id` int(11) NOT NULL,
  `com_name` varchar(50) NOT NULL,
  `com_comment` text NOT NULL,
  `food_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`com_id`, `com_name`, `com_comment`, `food_id`) VALUES
(22, 'pon', 'test', 2),
(27, 'Antonio Jack', 'à¸°à¸³à¸«à¸°à¸°à¸°', 2);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `cu_id` int(11) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`cu_id`, `email`, `password`, `name`, `address`) VALUES
(1, 'a@a.com', '123', 'Antonio Jack', 'This is an address'),
(2, 'b@b.com', '123', 'John Doe', 'John Doe\'s address'),
(3, 'c@c.com', '123', 'Jane Doe', 'Jane Doe\'s address');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `cu_id` int(11) DEFAULT NULL,
  `food_id` int(11) DEFAULT NULL,
  `orderDate` date NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `isDelivered` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 = not delivered, 1 otherwise'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `cu_id`, `food_id`, `orderDate`, `quantity`, `isDelivered`) VALUES
(1, 3, 2, '2017-01-22', 1, 0),
(2, 1, 2, '2017-01-22', 2, 0),
(3, 2, 2, '2017-02-22', 3, 0),
(4, 2, 2, '2017-03-22', 3, 0),
(5, 2, 2, '2017-03-22', 2, 0),
(6, 1, 2, '2017-04-22', 2, 0),
(7, 1, 2, '2017-04-22', 3, 0),
(8, 2, 2, '2017-04-22', 2, 0),
(9, 3, 2, '2017-04-22', 2, 0),
(10, 3, 2, '2017-04-22', 3, 0),
(11, 3, 2, '2017-05-22', 2, 0),
(12, 1, 2, '2017-05-22', 1, 0),
(13, 1, 2, '2017-05-22', 1, 0),
(14, 3, 2, '2017-06-22', 1, 0),
(15, 2, 2, '2017-07-22', 2, 0),
(16, 2, 2, '2017-07-22', 3, 0),
(17, 1, 2, '2017-07-22', 1, 0),
(18, 3, 2, '2017-08-22', 3, 0),
(19, 3, 2, '2017-08-22', 3, 0),
(20, 1, 2, '2017-08-22', 3, 0),
(21, 3, 2, '2017-09-22', 2, 0),
(22, 1, 2, '2017-09-22', 1, 0),
(23, 2, 2, '2017-09-22', 1, 0),
(24, 2, 2, '2017-09-22', 2, 0),
(25, 2, 2, '2017-09-22', 2, 0),
(26, 1, 2, '2017-10-22', 1, 0),
(27, 3, 2, '2017-10-22', 3, 0),
(28, 3, 2, '2017-10-22', 2, 0),
(29, 1, 2, '2017-10-22', 1, 0),
(30, 2, 2, '2017-10-22', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` double(10,2) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `comment` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `name`, `price`, `image`, `description`, `comment`) VALUES
(2, 'Samsung Galaxy S8 ', 22000.00, 'product-images/s8.jpg', 'Samsung Galaxy S8 \r\n-Samsung latest smartphone Flagship, came with top of the line gorgeous 5.8 inches 1440p super AMOLED Screen, 12MP camera and lightning fast CPU, GPU and RAM. \r\n', 0),
(3, 'iPhone X', 40000.00, 'product-images/ix.jpg', 'This chilled salad of noodles and crisp bell peppers tossed in a sesame oil-rice vinegar dressing provides a quick side dish or light meal. Great for make-ahead lunches too.', 0),
(4, 'Samsung Galaxy Note 8', 32000.00, 'product-images/note8.jpg', 'Thai Basil Chicken dish has spectacular taste even with regular basil instead of Thai or holy basil. The sauce actually acts like a glaze as the chicken mixture cooks over high heat. The recipe works best if you chop or grind your own chicken and have all ingredients prepped before you start cooking.', 0),
(5, 'google pixel 2', 33000.00, 'product-images/google.jpg', 'Tom Yum Koong,a famous Thai delicacy,is a spicy soup with shrimp in it. River shrimp sometimes use as shrimp', 0),
(7, 'HTC One A9', 15000.00, 'product-images/one.jpg', 'Porridge With Fish,a boiled rice with steamed fish this chinese style breakfast is famous for its simplicity and taste.\r\n', 0),
(8, 'Nokia 5', 9000.00, 'product-images/nikia.jpg', 'Thai Spicy Grilled Pork Salad(Yum Moo Yang)This is a spicy and sour grilled pork salad recipe that is cheap and easy . The cut of pork used is shoulder blade, which is not too fatty, but not too dry – it is just right! ', 0),
(9, 'Special Fish Cakes', 55.00, 'food-images/Thaifishcakes.jpg', 'A fishcake is a food item similar to a croquette, consisting of filleted fish or other seafood with potato patty, sometimes coated in breadcrumbs or batter, and fried.', 0),
(10, 'Casseroled Shrimps With Glass Noodles', 50.00, 'food-images/maxresdefault (1).jpg', '', 0),
(11, 'Pork Stir-Fried With Garlic And Peppercorns', 40.00, 'food-images/thai-fried-pork-with-garlic-and-pepper-recipe.jpg', '', 0),
(12, 'Fried Chicken', 35.00, 'food-images/Crispy-Fried-Chicken_exps6445_PSG143429D03_05_5b_RMS.jpg', '', 0),
(13, 'Green Chicken Curry', 40.00, 'food-images/global-recipes-01_cropped-green_curry2.jpg', '', 0),
(15, 'Crispy Wonton', 30.00, 'food-images/crispy-pork-wontons.jpg', '', 0),
(17, 'Honey Rost Duck', 70.00, 'food-images/HoneyRoastedDuck.jpg', '', 0),
(18, 'Quick-Fried Water Spinach Seasoned With Chili And Soy Sauce', 45.00, 'food-images/maxresdefault (2).jpg', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `wishlist_id` int(11) NOT NULL,
  `cu_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `cu_id` (`cu_id`),
  ADD KEY `product_id` (`product_id`) USING BTREE;

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`com_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`cu_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `cu_id` (`cu_id`),
  ADD KEY `food_id` (`food_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`wishlist_id`),
  ADD KEY `cu_id` (`cu_id`),
  ADD KEY `product_id` (`product_id`) USING BTREE,
  ADD KEY `product_id_2` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `com_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `cu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `wishlist_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`cu_id`) REFERENCES `customer` (`cu_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`cu_id`) REFERENCES `customer` (`cu_id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `product` (`product_id`);

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `cu_id` FOREIGN KEY (`cu_id`) REFERENCES `customer` (`cu_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
