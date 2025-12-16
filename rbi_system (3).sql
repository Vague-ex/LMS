-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 17, 2025 at 12:47 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rbi_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `ingredients`
--

CREATE TABLE `ingredients` (
  `ingredient_id` int(11) NOT NULL,
  `ingredient_name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `unit_id` int(11) NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  `cost_per_unit` decimal(10,2) NOT NULL DEFAULT 0.00,
  `min_stock_level` decimal(10,3) NOT NULL DEFAULT 0.000,
  `reorder_quantity` decimal(10,3) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `shelf_life_days` int(11) DEFAULT NULL,
  `is_perishable` tinyint(1) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ;

--
-- Dumping data for table `ingredients`
--

INSERT INTO `ingredients` (`ingredient_id`, `ingredient_name`, `description`, `unit_id`, `category`, `cost_per_unit`, `min_stock_level`, `reorder_quantity`, `supplier_id`, `shelf_life_days`, `is_perishable`, `is_active`, `created_by`, `created_at`, `updated_at`) VALUES
(6, 'test', 'teste', 2, '', 111111.00, 20.000, 19.000, 1, 5, 1, 1, 1, '2025-12-14 15:04:39', '2025-12-14 17:10:41'),
(8, 'minecraft', 'test', 2, '', 4.00, 4.000, 3.000, 3, 2, 1, 0, 1, '2025-12-14 15:44:34', '2025-12-15 03:36:59'),
(9, 'Mommy milkers', 'from supercreek', 3, 'Dairy', 8.00, 10.000, 5.000, 1, 6, 1, 1, 1, '2025-12-14 17:10:25', NULL),
(101, 'All-Purpose Flour', 'Premium all-purpose flour for baking', 1, 'Dry Goods', 0.80, 50.000, 25.000, 3, 365, 0, 1, 1, '2025-12-13 16:00:00', NULL),
(102, 'Granulated Sugar', 'White granulated sugar', 1, 'Dry Goods', 1.20, 40.000, 20.000, 3, 730, 0, 1, 1, '2025-12-13 16:00:00', NULL),
(103, 'Brown Sugar', 'Light brown sugar for baking', 1, 'Dry Goods', 1.50, 30.000, 15.000, 3, 365, 0, 1, 1, '2025-12-13 16:00:00', NULL),
(104, 'Baking Powder', 'Double-acting baking powder', 2, 'Dry Goods', 4.50, 5.000, 2.500, 3, 365, 0, 1, 1, '2025-12-13 16:00:00', NULL),
(105, 'Baking Soda', 'Pure baking soda', 2, 'Dry Goods', 3.00, 5.000, 2.500, 3, 730, 0, 1, 1, '2025-12-13 16:00:00', NULL),
(106, 'Salt', 'Sea salt', 2, 'Dry Goods', 1.00, 10.000, 5.000, 3, NULL, 0, 1, 1, '2025-12-13 16:00:00', NULL),
(107, 'Black Pepper', 'Freshly ground black pepper', 2, 'Spices', 8.00, 2.000, 1.000, 3, 365, 0, 1, 1, '2025-12-13 16:00:00', NULL),
(108, 'Garlic Powder', 'Dehydrated garlic powder', 2, 'Spices', 6.50, 3.000, 1.500, 3, 365, 0, 1, 1, '2025-12-13 16:00:00', NULL),
(109, 'Onion Powder', 'Dehydrated onion powder', 2, 'Spices', 5.50, 3.000, 1.500, 3, 365, 0, 1, 1, '2025-12-13 16:00:00', NULL),
(110, 'Paprika', 'Sweet Hungarian paprika', 2, 'Spices', 9.00, 2.000, 1.000, 3, 180, 0, 1, 1, '2025-12-13 16:00:00', NULL),
(111, 'Cinnamon', 'Ground cinnamon', 2, 'Spices', 12.00, 2.000, 1.000, 3, 365, 0, 1, 1, '2025-12-13 16:00:00', NULL),
(112, 'Nutmeg', 'Ground nutmeg', 2, 'Spices', 15.00, 1.000, 0.500, 3, 365, 0, 1, 1, '2025-12-13 16:00:00', NULL),
(113, 'Vanilla Extract', 'Pure vanilla extract', 4, 'Flavorings', 25.00, 2.000, 1.000, 3, 365, 0, 1, 1, '2025-12-13 16:00:00', NULL),
(114, 'Olive Oil', 'Extra virgin olive oil', 3, 'Oils', 12.00, 10.000, 5.000, 3, 365, 0, 1, 1, '2025-12-13 16:00:00', NULL),
(115, 'Vegetable Oil', 'Canola vegetable oil', 3, 'Oils', 8.00, 15.000, 7.500, 3, 365, 0, 1, 1, '2025-12-13 16:00:00', NULL),
(116, 'Sesame Oil', 'Toasted sesame oil', 3, 'Oils', 18.00, 5.000, 2.500, 3, 365, 0, 1, 1, '2025-12-13 16:00:00', NULL),
(117, 'Soy Sauce', 'Premium soy sauce', 3, 'Condiments', 6.00, 8.000, 4.000, 3, 365, 0, 1, 1, '2025-12-13 16:00:00', NULL),
(118, 'Rice Vinegar', 'Seasoned rice vinegar', 3, 'Condiments', 5.00, 5.000, 2.500, 3, 365, 0, 1, 1, '2025-12-13 16:00:00', NULL),
(119, 'Worcestershire Sauce', 'Lea & Perrins Worcestershire', 3, 'Condiments', 7.50, 4.000, 2.000, 3, 365, 0, 1, 1, '2025-12-13 16:00:00', NULL),
(120, 'Honey', 'Raw clover honey', 3, 'Sweeteners', 15.00, 5.000, 2.500, 3, NULL, 0, 1, 1, '2025-12-13 16:00:00', NULL),
(121, 'Maple Syrup', 'Pure maple syrup', 3, 'Sweeteners', 22.00, 4.000, 2.000, 3, 365, 0, 1, 1, '2025-12-13 16:00:00', NULL),
(122, 'Dijon Mustard', 'Grey Poupon Dijon mustard', 3, 'Condiments', 6.50, 4.000, 2.000, 3, 365, 0, 1, 1, '2025-12-13 16:00:00', NULL),
(123, 'Mayonnaise', 'Hellmann\'s mayonnaise', 3, 'Condiments', 5.00, 6.000, 3.000, 3, 90, 1, 1, 1, '2025-12-13 16:00:00', NULL),
(124, 'Ketchup', 'Heinz ketchup', 3, 'Condiments', 4.00, 10.000, 5.000, 3, 365, 0, 1, 1, '2025-12-13 16:00:00', NULL),
(125, 'Chicken Breast', 'Boneless skinless chicken breast', 1, 'Meat', 6.50, 30.000, 15.000, 2, 3, 1, 1, 1, '2025-12-13 16:00:00', NULL),
(126, 'Ground Beef', '80/20 ground beef', 1, 'Meat', 5.50, 25.000, 12.500, 2, 2, 1, 1, 1, '2025-12-13 16:00:00', NULL),
(127, 'Bacon', 'Applewood smoked bacon', 1, 'Meat', 8.00, 20.000, 10.000, 2, 7, 1, 1, 1, '2025-12-13 16:00:00', NULL),
(128, 'Pork Chops', 'Center-cut pork chops', 1, 'Meat', 7.50, 15.000, 7.500, 2, 3, 1, 1, 1, '2025-12-13 16:00:00', NULL),
(129, 'Salmon Fillet', 'Atlantic salmon fillet', 1, 'Seafood', 12.00, 10.000, 5.000, 2, 2, 1, 1, 1, '2025-12-13 16:00:00', NULL),
(130, 'Shrimp', 'Large peeled deveined shrimp', 1, 'Seafood', 15.00, 8.000, 4.000, 2, 2, 1, 1, 1, '2025-12-13 16:00:00', NULL),
(131, 'Whole Milk', 'Whole vitamin D milk', 3, 'Dairy', 3.50, 20.000, 10.000, 1, 7, 1, 1, 1, '2025-12-13 16:00:00', NULL),
(132, 'Heavy Cream', 'Heavy whipping cream', 3, 'Dairy', 5.00, 10.000, 5.000, 1, 14, 1, 1, 1, '2025-12-13 16:00:00', NULL),
(133, 'Butter', 'Unsalted butter', 2, 'Dairy', 4.00, 15.000, 7.500, 1, 30, 1, 1, 1, '2025-12-13 16:00:00', NULL),
(134, 'Eggs', 'Large grade A eggs', 5, 'Dairy', 0.25, 100.000, 50.000, 1, 21, 1, 1, 1, '2025-12-13 16:00:00', NULL),
(135, 'Cheddar Cheese', 'Sharp cheddar cheese block', 1, 'Dairy', 8.00, 10.000, 5.000, 1, 21, 1, 1, 1, '2025-12-13 16:00:00', NULL),
(136, 'Parmesan Cheese', 'Parmigiano-Reggiano wedge', 1, 'Dairy', 18.00, 5.000, 2.500, 1, 60, 1, 1, 1, '2025-12-13 16:00:00', NULL),
(137, 'Cream Cheese', 'Philadelphia cream cheese', 2, 'Dairy', 4.50, 8.000, 4.000, 1, 30, 1, 1, 1, '2025-12-13 16:00:00', NULL),
(138, 'Sour Cream', 'Daisy sour cream', 2, 'Dairy', 3.50, 10.000, 5.000, 1, 21, 1, 1, 1, '2025-12-13 16:00:00', NULL),
(139, 'Yogurt', 'Plain Greek yogurt', 2, 'Dairy', 5.00, 12.000, 6.000, 1, 14, 1, 1, 1, '2025-12-13 16:00:00', NULL),
(140, 'Romaine Lettuce', 'Fresh romaine hearts', 7, 'Produce', 2.50, 15.000, 7.500, 1, 7, 1, 1, 1, '2025-12-13 16:00:00', NULL),
(141, 'Spinach', 'Baby spinach leaves', 2, 'Produce', 4.00, 8.000, 4.000, 1, 5, 1, 1, 1, '2025-12-13 16:00:00', NULL),
(142, 'Tomatoes', 'Roma tomatoes', 5, 'Produce', 0.40, 50.000, 25.000, 1, 7, 1, 1, 1, '2025-12-13 16:00:00', NULL),
(143, 'Onions', 'Yellow onions', 5, 'Produce', 0.30, 40.000, 20.000, 1, 30, 1, 1, 1, '2025-12-13 16:00:00', NULL),
(144, 'Garlic', 'Fresh garlic bulbs', 5, 'Produce', 0.50, 30.000, 15.000, 1, 14, 1, 1, 1, '2025-12-13 16:00:00', NULL),
(145, 'Carrots', 'Whole carrots', 5, 'Produce', 0.20, 40.000, 20.000, 1, 21, 1, 1, 1, '2025-12-13 16:00:00', NULL),
(146, 'Celery', 'Celery stalks', 5, 'Produce', 0.25, 30.000, 15.000, 1, 14, 1, 1, 1, '2025-12-13 16:00:00', NULL),
(147, 'Potatoes', 'Russet potatoes', 5, 'Produce', 0.35, 60.000, 30.000, 1, 30, 1, 1, 1, '2025-12-13 16:00:00', NULL),
(148, 'Bell Peppers', 'Red bell peppers', 5, 'Produce', 0.75, 20.000, 10.000, 1, 7, 1, 1, 1, '2025-12-13 16:00:00', NULL),
(149, 'Mushrooms', 'White button mushrooms', 2, 'Produce', 3.50, 10.000, 5.000, 1, 5, 1, 1, 1, '2025-12-13 16:00:00', NULL),
(150, 'Lemons', 'Fresh lemons', 5, 'Produce', 0.50, 25.000, 12.500, 1, 14, 1, 1, 1, '2025-12-13 16:00:00', NULL),
(151, 'Limes', 'Fresh limes', 5, 'Produce', 0.40, 25.000, 12.500, 1, 14, 1, 1, 1, '2025-12-13 16:00:00', NULL),
(152, 'Apples', 'Granny Smith apples', 5, 'Produce', 0.60, 30.000, 15.000, 1, 21, 1, 1, 1, '2025-12-13 16:00:00', NULL),
(153, 'Bananas', 'Ripe bananas', 5, 'Produce', 0.25, 40.000, 20.000, 1, 5, 1, 1, 1, '2025-12-13 16:00:00', NULL),
(154, 'Oranges', 'Navel oranges', 5, 'Produce', 0.45, 35.000, 17.500, 1, 14, 1, 1, 1, '2025-12-13 16:00:00', NULL),
(155, 'Strawberries', 'Fresh strawberries', 2, 'Produce', 6.00, 8.000, 4.000, 1, 3, 1, 1, 1, '2025-12-13 16:00:00', NULL),
(156, 'Blueberries', 'Fresh blueberries', 2, 'Produce', 8.00, 6.000, 3.000, 1, 5, 1, 1, 1, '2025-12-13 16:00:00', NULL),
(157, 'Rice', 'Long grain white rice', 1, 'Grains', 2.00, 40.000, 20.000, 3, 730, 0, 1, 1, '2025-12-13 16:00:00', NULL),
(158, 'Pasta', 'Spaghetti pasta', 1, 'Grains', 1.50, 30.000, 15.000, 3, 365, 0, 1, 1, '2025-12-13 16:00:00', NULL),
(159, 'Bread', 'Italian bread loaf', 5, 'Bakery', 2.50, 20.000, 10.000, 3, 3, 1, 1, 1, '2025-12-13 16:00:00', NULL),
(160, 'Tortillas', 'Flour tortillas', 5, 'Bakery', 3.00, 25.000, 12.500, 3, 7, 1, 1, 1, '2025-12-13 16:00:00', NULL),
(161, 'Chicken Broth', 'Low sodium chicken broth', 3, 'Canned Goods', 2.50, 15.000, 7.500, 3, 365, 0, 1, 1, '2025-12-13 16:00:00', NULL),
(162, 'Beef Broth', 'Low sodium beef broth', 3, 'Canned Goods', 2.75, 12.000, 6.000, 3, 365, 0, 1, 1, '2025-12-13 16:00:00', NULL),
(163, 'Tomato Sauce', 'Crushed tomato sauce', 3, 'Canned Goods', 2.00, 20.000, 10.000, 3, 365, 0, 1, 1, '2025-12-13 16:00:00', NULL),
(164, 'Tomato Paste', 'Concentrated tomato paste', 3, 'Canned Goods', 3.50, 10.000, 5.000, 3, 365, 0, 1, 1, '2025-12-13 16:00:00', NULL),
(165, 'Canned Tomatoes', 'Diced canned tomatoes', 5, 'Canned Goods', 1.50, 25.000, 12.500, 3, 365, 0, 1, 1, '2025-12-13 16:00:00', NULL),
(166, 'Black Beans', 'Canned black beans', 5, 'Canned Goods', 1.25, 20.000, 10.000, 3, 365, 0, 1, 1, '2025-12-13 16:00:00', NULL),
(167, 'Kidney Beans', 'Canned kidney beans', 5, 'Canned Goods', 1.30, 18.000, 9.000, 3, 365, 0, 1, 1, '2025-12-13 16:00:00', NULL),
(168, 'Corn', 'Canned corn kernels', 5, 'Canned Goods', 1.20, 20.000, 10.000, 3, 365, 0, 1, 1, '2025-12-13 16:00:00', NULL),
(169, 'Green Beans', 'Canned green beans', 5, 'Canned Goods', 1.10, 22.000, 11.000, 3, 365, 0, 1, 1, '2025-12-13 16:00:00', NULL),
(170, 'Tuna', 'Canned tuna in water', 5, 'Canned Goods', 2.50, 15.000, 7.500, 3, 365, 0, 1, 1, '2025-12-13 16:00:00', NULL),
(171, 'Coffee', 'Ground coffee beans', 1, 'Beverages', 12.00, 10.000, 5.000, 3, 180, 0, 1, 1, '2025-12-13 16:00:00', NULL),
(172, 'Tea Bags', 'Black tea bags', 5, 'Beverages', 0.10, 200.000, 100.000, 3, 365, 0, 1, 1, '2025-12-13 16:00:00', NULL),
(173, 'Cocoa Powder', 'Unsweetened cocoa powder', 2, 'Baking', 9.00, 5.000, 2.500, 3, 365, 0, 1, 1, '2025-12-13 16:00:00', NULL),
(174, 'Chocolate Chips', 'Semi-sweet chocolate chips', 2, 'Baking', 6.00, 8.000, 4.000, 3, 365, 0, 1, 1, '2025-12-13 16:00:00', NULL),
(175, 'Peanut Butter', 'Creamy peanut butter', 2, 'Spreads', 5.50, 12.000, 6.000, 3, 180, 0, 1, 1, '2025-12-13 16:00:00', NULL),
(176, 'Jelly', 'Grape jelly', 2, 'Spreads', 4.00, 10.000, 5.000, 3, 365, 0, 1, 1, '2025-12-13 16:00:00', NULL),
(177, 'Pickles', 'Dill pickle slices', 2, 'Condiments', 3.50, 8.000, 4.000, 3, 365, 0, 1, 1, '2025-12-13 16:00:00', NULL),
(178, 'Olives', 'Sliced black olives', 2, 'Condiments', 4.50, 6.000, 3.000, 3, 365, 0, 1, 1, '2025-12-13 16:00:00', NULL),
(179, 'Capers', 'Small capers in brine', 2, 'Condiments', 8.00, 3.000, 1.500, 3, 365, 0, 1, 1, '2025-12-13 16:00:00', NULL),
(180, 'Anchovies', 'Anchovy fillets in oil', 2, 'Seafood', 12.00, 2.000, 1.000, 3, 365, 0, 1, 1, '2025-12-13 16:00:00', NULL),
(181, 'Salsa', 'Medium chunky salsa', 3, 'Condiments', 4.00, 10.000, 5.000, 3, 90, 1, 1, 1, '2025-12-13 16:00:00', NULL),
(182, 'Guacamole', 'Fresh guacamole', 2, 'Condiments', 7.00, 8.000, 4.000, 1, 3, 1, 1, 1, '2025-12-13 16:00:00', NULL),
(183, 'Sour Dough', 'Sour dough bread', 5, 'Bakery', 3.50, 15.000, 7.500, 3, 3, 1, 1, 1, '2025-12-13 16:00:00', NULL),
(184, 'Bagels', 'Plain bagels', 5, 'Bakery', 1.00, 30.000, 15.000, 3, 5, 1, 1, 1, '2025-12-13 16:00:00', NULL),
(185, 'Croissants', 'Butter croissants', 5, 'Bakery', 1.50, 25.000, 12.500, 3, 3, 1, 1, 1, '2025-12-13 16:00:00', NULL),
(186, 'Muffins', 'Blueberry muffins', 5, 'Bakery', 2.00, 20.000, 10.000, 3, 3, 1, 1, 1, '2025-12-13 16:00:00', NULL),
(187, 'Cake', 'Chocolate cake', 5, 'Desserts', 15.00, 5.000, 2.500, 3, 5, 1, 1, 1, '2025-12-13 16:00:00', NULL),
(188, 'Pie', 'Apple pie', 5, 'Desserts', 12.00, 6.000, 3.000, 3, 5, 1, 1, 1, '2025-12-13 16:00:00', NULL),
(189, 'Ice Cream', 'Vanilla ice cream', 2, 'Desserts', 6.00, 10.000, 5.000, 1, 30, 1, 1, 1, '2025-12-13 16:00:00', NULL),
(190, 'Whipped Cream', 'Canned whipped cream', 5, 'Desserts', 3.50, 12.000, 6.000, 3, 90, 1, 1, 1, '2025-12-13 16:00:00', NULL),
(191, 'Marinara Sauce', 'Traditional marinara sauce', 3, 'Sauces', 5.00, 15.000, 7.500, 3, 90, 1, 1, 1, '2025-12-13 16:00:00', NULL),
(192, 'Alfredo Sauce', 'Creamy Alfredo sauce', 3, 'Sauces', 6.50, 10.000, 5.000, 3, 90, 1, 1, 1, '2025-12-13 16:00:00', NULL),
(193, 'BBQ Sauce', 'Hickory BBQ sauce', 3, 'Sauces', 4.50, 12.000, 6.000, 3, 365, 0, 1, 1, '2025-12-13 16:00:00', NULL),
(194, 'Hot Sauce', 'Tabasco hot sauce', 3, 'Condiments', 5.00, 8.000, 4.000, 3, 365, 0, 1, 1, '2025-12-13 16:00:00', NULL),
(195, 'Oregano', 'Dried oregano', 2, 'Spices', 7.00, 4.000, 2.000, 3, 365, 0, 1, 1, '2025-12-13 16:00:00', NULL),
(196, 'Basil', 'Dried basil', 2, 'Spices', 7.50, 4.000, 2.000, 3, 365, 0, 1, 1, '2025-12-13 16:00:00', NULL),
(197, 'Thyme', 'Dried thyme', 2, 'Spices', 8.00, 3.000, 1.500, 3, 365, 0, 1, 1, '2025-12-13 16:00:00', NULL),
(198, 'Rosemary', 'Dried rosemary', 2, 'Spices', 8.50, 3.000, 1.500, 3, 365, 0, 1, 1, '2025-12-13 16:00:00', NULL),
(199, 'Bay Leaves', 'Dried bay leaves', 2, 'Spices', 9.00, 2.000, 1.000, 3, 365, 0, 1, 1, '2025-12-13 16:00:00', NULL),
(200, 'Cumin', 'Ground cumin', 2, 'Spices', 10.00, 3.000, 1.500, 3, 365, 0, 1, 1, '2025-12-13 16:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `inventory_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  `current_stock` decimal(10,3) NOT NULL DEFAULT 0.000,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_by` int(11) NOT NULL
) ;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`inventory_id`, `ingredient_id`, `current_stock`, `last_updated`, `updated_by`) VALUES
(1, 6, 110.000, '2025-12-14 17:12:26', 1),
(2, 8, 200.000, '2025-12-14 16:07:38', 1),
(3, 9, 100.000, '2025-12-14 17:12:48', 1),
(101, 101, 75.500, '2025-12-13 16:00:00', 1),
(102, 102, 60.200, '2025-12-13 16:00:00', 1),
(103, 103, 45.800, '2025-12-13 16:00:00', 1),
(104, 104, 8.500, '2025-12-13 16:00:00', 1),
(105, 105, 9.200, '2025-12-13 16:00:00', 1),
(106, 106, 18.700, '2025-12-13 16:00:00', 1),
(107, 107, 3.500, '2025-12-13 16:00:00', 1),
(108, 108, 5.200, '2025-12-13 16:00:00', 1),
(109, 109, 4.800, '2025-12-13 16:00:00', 1),
(110, 110, 3.100, '2025-12-13 16:00:00', 1),
(111, 111, 3.800, '2025-12-13 16:00:00', 1),
(112, 112, 2.200, '2025-12-13 16:00:00', 1),
(113, 113, 3.500, '2025-12-13 16:00:00', 1),
(114, 114, 18.300, '2025-12-13 16:00:00', 1),
(115, 115, 25.600, '2025-12-13 16:00:00', 1),
(116, 116, 8.200, '2025-12-13 16:00:00', 1),
(117, 117, 12.800, '2025-12-13 16:00:00', 1),
(118, 118, 7.500, '2025-12-13 16:00:00', 1),
(119, 119, 6.300, '2025-12-13 16:00:00', 1),
(120, 120, 8.200, '2025-12-13 16:00:00', 1),
(121, 121, 6.500, '2025-12-13 16:00:00', 1),
(122, 122, 6.800, '2025-12-13 16:00:00', 1),
(123, 123, 10.200, '2025-12-13 16:00:00', 1),
(124, 124, 15.600, '2025-12-13 16:00:00', 1),
(125, 125, 45.300, '2025-12-13 16:00:00', 1),
(126, 126, 38.700, '2025-12-13 16:00:00', 1),
(127, 127, 28.500, '2025-12-13 16:00:00', 1),
(128, 128, 22.800, '2025-12-13 16:00:00', 1),
(129, 129, 15.200, '2025-12-13 16:00:00', 1),
(130, 130, 12.500, '2025-12-13 16:00:00', 1),
(131, 131, 35.600, '2025-12-13 16:00:00', 1),
(132, 132, 18.200, '2025-12-13 16:00:00', 1),
(133, 133, 25.800, '2025-12-13 16:00:00', 1),
(134, 134, 156.000, '2025-12-13 16:00:00', 1),
(135, 135, 18.500, '2025-12-13 16:00:00', 1),
(136, 136, 8.200, '2025-12-13 16:00:00', 1),
(137, 137, 12.300, '2025-12-13 16:00:00', 1),
(138, 138, 16.800, '2025-12-13 16:00:00', 1),
(139, 139, 20.500, '2025-12-13 16:00:00', 1),
(140, 140, 22.000, '2025-12-13 16:00:00', 1),
(141, 141, 12.800, '2025-12-13 16:00:00', 1),
(142, 142, 68.000, '2025-12-13 16:00:00', 1),
(143, 143, 52.500, '2025-12-13 16:00:00', 1),
(144, 144, 38.000, '2025-12-13 16:00:00', 1),
(145, 145, 55.200, '2025-12-13 16:00:00', 1),
(146, 146, 42.800, '2025-12-13 16:00:00', 1),
(147, 147, 85.600, '2025-12-13 16:00:00', 1),
(148, 148, 28.500, '2025-12-13 16:00:00', 1),
(149, 149, 15.200, '2025-12-13 16:00:00', 1),
(150, 150, 35.000, '2025-12-13 16:00:00', 1),
(151, 151, 32.500, '2025-12-13 16:00:00', 1),
(152, 152, 45.800, '2025-12-13 16:00:00', 1),
(153, 153, 52.300, '2025-12-13 16:00:00', 1),
(154, 154, 48.700, '2025-12-13 16:00:00', 1),
(155, 155, 12.500, '2025-12-13 16:00:00', 1),
(156, 156, 9.800, '2025-12-13 16:00:00', 1),
(157, 157, 65.300, '2025-12-13 16:00:00', 1),
(158, 158, 48.700, '2025-12-13 16:00:00', 1),
(159, 159, 28.500, '2025-12-13 16:00:00', 1),
(160, 160, 35.200, '2025-12-13 16:00:00', 1),
(161, 161, 22.800, '2025-12-13 16:00:00', 1),
(162, 162, 18.500, '2025-12-13 16:00:00', 1),
(163, 163, 32.600, '2025-12-13 16:00:00', 1),
(164, 164, 15.200, '2025-12-13 16:00:00', 1),
(165, 165, 38.700, '2025-12-13 16:00:00', 1),
(166, 166, 28.500, '2025-12-13 16:00:00', 1),
(167, 167, 25.800, '2025-12-13 16:00:00', 1),
(168, 168, 32.200, '2025-12-13 16:00:00', 1),
(169, 169, 30.500, '2025-12-13 16:00:00', 1),
(170, 170, 22.800, '2025-12-13 16:00:00', 1),
(171, 171, 18.500, '2025-12-13 16:00:00', 1),
(172, 172, 256.000, '2025-12-13 16:00:00', 1),
(173, 173, 8.200, '2025-12-13 16:00:00', 1),
(174, 174, 12.500, '2025-12-13 16:00:00', 1),
(175, 175, 18.800, '2025-12-13 16:00:00', 1),
(176, 176, 15.200, '2025-12-13 16:00:00', 1),
(177, 177, 12.500, '2025-12-13 16:00:00', 1),
(178, 178, 9.800, '2025-12-13 16:00:00', 1),
(179, 179, 5.200, '2025-12-13 16:00:00', 1),
(180, 180, 3.500, '2025-12-13 16:00:00', 1),
(181, 181, 15.800, '2025-12-13 16:00:00', 1),
(182, 182, 12.500, '2025-12-13 16:00:00', 1),
(183, 183, 22.000, '2025-12-13 16:00:00', 1),
(184, 184, 42.800, '2025-12-13 16:00:00', 1),
(185, 185, 35.200, '2025-12-13 16:00:00', 1),
(186, 186, 28.500, '2025-12-13 16:00:00', 1),
(187, 187, 8.200, '2025-12-13 16:00:00', 1),
(188, 188, 9.500, '2025-12-13 16:00:00', 1),
(189, 189, 15.800, '2025-12-13 16:00:00', 1),
(190, 190, 18.200, '2025-12-13 16:00:00', 1),
(191, 191, 22.500, '2025-12-13 16:00:00', 1),
(192, 192, 18.800, '2025-12-13 16:00:00', 1),
(193, 193, 20.200, '2025-12-13 16:00:00', 1),
(194, 194, 12.500, '2025-12-13 16:00:00', 1),
(195, 195, 6.800, '2025-12-13 16:00:00', 1),
(196, 196, 6.500, '2025-12-13 16:00:00', 1),
(197, 197, 5.200, '2025-12-13 16:00:00', 1),
(198, 198, 5.000, '2025-12-13 16:00:00', 1),
(199, 199, 3.800, '2025-12-13 16:00:00', 1),
(200, 200, 5.500, '2025-12-13 16:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_orders`
--

CREATE TABLE `purchase_orders` (
  `po_id` int(11) NOT NULL,
  `po_number` varchar(50) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `expected_delivery` date DEFAULT NULL,
  `status` enum('DRAFT','SENT','CONFIRMED','PARTIAL','RECEIVED','CANCELLED') NOT NULL DEFAULT 'DRAFT',
  `total_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `notes` text DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `completed_at` datetime DEFAULT NULL
) ;

--
-- Dumping data for table `purchase_orders`
--

INSERT INTO `purchase_orders` (`po_id`, `po_number`, `supplier_id`, `order_date`, `expected_delivery`, `status`, `total_amount`, `notes`, `created_by`, `created_at`, `updated_at`, `completed_at`) VALUES
(1, 'PO-20251215-1984', 3, '2025-12-15', '2025-12-22', '', 2000.00, '', 1, '2025-12-15 04:59:41', '2025-12-15 04:59:41', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_details`
--

CREATE TABLE `purchase_order_details` (
  `po_detail_id` int(11) NOT NULL,
  `po_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  `quantity_ordered` decimal(10,3) NOT NULL,
  `quantity_received` decimal(10,3) NOT NULL DEFAULT 0.000,
  `unit_cost` decimal(10,2) NOT NULL,
  `total_cost` decimal(10,2) NOT NULL,
  `received_date` date DEFAULT NULL
) ;

--
-- Dumping data for table `purchase_order_details`
--

INSERT INTO `purchase_order_details` (`po_detail_id`, `po_id`, `ingredient_id`, `quantity_ordered`, `quantity_received`, `unit_cost`, `total_cost`, `received_date`) VALUES
(1, 1, 162, 10.000, 0.000, 200.00, 2000.00, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `recipes`
--

CREATE TABLE `recipes` (
  `recipe_id` int(11) NOT NULL,
  `recipe_name` varchar(100) NOT NULL,
  `recipe_code` varchar(20) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `serving_size` int(11) NOT NULL DEFAULT 1,
  `preparation_time` int(11) DEFAULT NULL,
  `cooking_time` int(11) DEFAULT NULL,
  `instructions` text DEFAULT NULL,
  `difficulty_level` enum('Easy','Medium','Hard') DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `cost_per_serving` decimal(10,2) NOT NULL DEFAULT 0.00,
  `selling_price` decimal(10,2) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ;

--
-- Dumping data for table `recipes`
--

INSERT INTO `recipes` (`recipe_id`, `recipe_name`, `recipe_code`, `description`, `serving_size`, `preparation_time`, `cooking_time`, `instructions`, `difficulty_level`, `category`, `cost_per_serving`, `selling_price`, `is_active`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'truffle', '123123123123', 'monster', 1, 22, 1, 'bla bla bal words', 'Medium', 'Appetizer', 111127.00, 11.00, 1, 1, '2025-12-14 17:29:56', '2025-12-14 17:29:56'),
(101, 'Classic Beef Burger', 'BURGER001', 'Juicy beef burger with fresh toppings', 1, 15, 10, '1. Season ground beef with salt and pepper\n2. Form into patties\n3. Grill for 5 minutes per side\n4. Toast buns\n5. Assemble with lettuce, tomato, and sauce', 'Easy', 'Main Course', 3.50, 12.99, 1, 1, '2025-12-13 16:00:00', NULL),
(102, 'Caesar Salad', 'SALAD001', 'Classic Caesar salad with homemade dressing', 1, 20, 0, '1. Wash and chop romaine lettuce\n2. Make dressing with mayo, garlic, anchovies\n3. Toss lettuce with dressing\n4. Add croutons and Parmesan', 'Easy', 'Appetizer', 2.80, 8.99, 1, 1, '2025-12-13 16:00:00', NULL),
(103, 'Spaghetti Bolognese', 'PASTA001', 'Traditional Italian meat sauce with pasta', 1, 30, 60, '1. Brown ground beef with onions and garlic\n2. Add tomato sauce and paste\n3. Simmer for 1 hour\n4. Cook spaghetti al dente\n5. Serve with Parmesan cheese', 'Medium', 'Main Course', 4.20, 14.99, 1, 1, '2025-12-13 16:00:00', NULL),
(104, 'Chicken Alfredo', 'PASTA002', 'Creamy Alfredo sauce with grilled chicken', 1, 25, 20, '1. Grill chicken breast seasoned with salt and pepper\n2. Cook fettuccine pasta\n3. Make Alfredo sauce with cream and butter\n4. Combine all ingredients\n5. Garnish with parsley', 'Medium', 'Main Course', 5.00, 16.99, 1, 1, '2025-12-13 16:00:00', NULL),
(105, 'Chocolate Chip Cookies', 'DESSERT001', 'Classic chewy chocolate chip cookies', 12, 15, 12, '1. Cream butter and sugars\n2. Add eggs and vanilla\n3. Mix in dry ingredients\n4. Fold in chocolate chips\n5. Bake at 350°F for 12 minutes', 'Easy', 'Dessert', 0.50, 2.99, 1, 1, '2025-12-13 16:00:00', NULL),
(106, 'French Toast', 'BREAKFAST001', 'Golden brown French toast with maple syrup', 2, 10, 10, '1. Whisk eggs, milk, cinnamon, and vanilla\n2. Dip bread slices in mixture\n3. Cook on buttered griddle until golden\n4. Serve with maple syrup', 'Easy', 'Breakfast', 1.80, 9.99, 1, 1, '2025-12-13 16:00:00', NULL),
(107, 'Vegetable Stir Fry', 'VEG001', 'Fresh vegetables in savory sauce', 2, 15, 10, '1. Chop all vegetables\n2. Heat oil in wok\n3. Stir-fry vegetables until crisp-tender\n4. Add soy sauce and sesame oil\n5. Serve over rice', 'Easy', 'Main Course', 3.00, 11.99, 1, 1, '2025-12-13 16:00:00', NULL),
(108, 'Grilled Salmon', 'FISH001', 'Herb-crusted grilled salmon fillet', 1, 10, 15, '1. Season salmon with herbs and lemon\n2. Grill skin-side down first\n3. Cook until flaky\n4. Serve with lemon wedges', 'Medium', 'Main Course', 6.50, 19.99, 1, 1, '2025-12-13 16:00:00', NULL),
(109, 'Tomato Soup', 'SOUP001', 'Creamy tomato basil soup', 2, 10, 25, '1. Sauté onions and garlic\n2. Add tomatoes and broth\n3. Simmer for 20 minutes\n4. Blend until smooth\n5. Stir in cream and basil', 'Easy', 'Appetizer', 2.20, 7.99, 1, 1, '2025-12-13 16:00:00', NULL),
(110, 'Guacamole', 'DIP001', 'Fresh avocado dip with lime and cilantro', 4, 15, 0, '1. Mash ripe avocados\n2. Add lime juice, onion, tomato\n3. Mix in cilantro and seasonings\n4. Chill before serving', 'Easy', 'Appetizer', 1.80, 6.99, 1, 1, '2025-12-13 16:00:00', NULL),
(111, 'Beef Tacos', 'MEX001', 'Seasoned beef in crispy taco shells', 2, 20, 15, '1. Brown ground beef with taco seasoning\n2. Warm taco shells\n3. Prepare toppings\n4. Fill shells with beef and toppings', 'Easy', 'Main Course', 3.80, 13.99, 1, 1, '2025-12-13 16:00:00', NULL),
(112, 'Garlic Bread', 'SIDE001', 'Toasted bread with garlic butter', 4, 10, 8, '1. Mix butter with minced garlic\n2. Spread on bread slices\n3. Bake until golden and crispy', 'Easy', 'Side Dish', 0.80, 3.99, 1, 1, '2025-12-13 16:00:00', NULL),
(113, 'Chicken Noodle Soup', 'SOUP002', 'Comforting homemade chicken noodle soup', 4, 20, 40, '1. Simmer chicken in broth\n2. Remove chicken, shred meat\n3. Add vegetables and noodles\n4. Cook until noodles are tender\n5. Return chicken to soup', 'Easy', 'Main Course', 2.50, 10.99, 1, 1, '2025-12-13 16:00:00', NULL),
(114, 'Berry Smoothie', 'BEV001', 'Mixed berry yogurt smoothie', 1, 5, 0, '1. Combine berries, yogurt, and honey\n2. Blend until smooth\n3. Add ice if desired\n4. Serve immediately', 'Easy', 'Beverage', 2.00, 6.99, 1, 1, '2025-12-13 16:00:00', NULL),
(115, 'Pancakes', 'BREAKFAST002', 'Fluffy buttermilk pancakes', 4, 10, 15, '1. Mix dry ingredients\n2. Combine wet ingredients\n3. Mix until just combined\n4. Cook on hot griddle\n5. Serve with butter and syrup', 'Easy', 'Breakfast', 1.20, 8.99, 1, 1, '2025-12-13 16:00:00', NULL),
(116, 'Shrimp Scampi', 'SEAFOOD001', 'Garlic butter shrimp with pasta', 2, 15, 10, '1. Sauté garlic in butter\n2. Add shrimp and cook until pink\n3. Deglaze with white wine\n4. Toss with cooked linguine\n5. Garnish with parsley', 'Medium', 'Main Course', 5.80, 18.99, 1, 1, '2025-12-13 16:00:00', NULL),
(117, 'Chocolate Cake', 'DESSERT002', 'Rich chocolate layer cake', 8, 30, 35, '1. Mix dry ingredients\n2. Cream butter and sugar\n3. Add eggs one at a time\n4. Alternate dry ingredients with milk\n5. Bake at 350°F for 35 minutes', 'Hard', 'Dessert', 2.50, 24.99, 1, 1, '2025-12-13 16:00:00', NULL),
(118, 'Mashed Potatoes', 'SIDE002', 'Creamy homemade mashed potatoes', 4, 15, 20, '1. Boil potatoes until tender\n2. Drain and mash\n3. Add butter, milk, and cream\n4. Season with salt and pepper', 'Easy', 'Side Dish', 1.00, 4.99, 1, 1, '2025-12-13 16:00:00', NULL),
(119, 'BBQ Chicken', 'MEAT001', 'Grilled chicken with BBQ sauce', 4, 10, 25, '1. Season chicken pieces\n2. Grill until almost cooked\n3. Brush with BBQ sauce\n4. Continue grilling until glazed', 'Medium', 'Main Course', 3.20, 15.99, 1, 1, '2025-12-13 16:00:00', NULL),
(120, 'Greek Salad', 'SALAD002', 'Fresh Mediterranean salad', 2, 15, 0, '1. Chop vegetables\n2. Combine with olives and feta\n3. Dress with olive oil and lemon\n4. Season with oregano', 'Easy', 'Appetizer', 2.50, 9.99, 1, 1, '2025-12-13 16:00:00', NULL),
(121, 'Chili Con Carne', 'STEW001', 'Spicy beef and bean chili', 6, 20, 90, '1. Brown ground beef with onions\n2. Add spices and tomatoes\n3. Simmer with beans for 1.5 hours\n4. Serve with toppings', 'Medium', 'Main Course', 3.00, 12.99, 1, 1, '2025-12-13 16:00:00', NULL),
(122, 'Eggs Benedict', 'BREAKFAST003', 'Poached eggs with hollandaise on English muffin', 2, 25, 10, '1. Toast English muffins\n2. Poach eggs\n3. Make hollandaise sauce\n4. Assemble with ham or bacon\n5. Top with sauce', 'Hard', 'Breakfast', 2.80, 14.99, 1, 1, '2025-12-13 16:00:00', NULL),
(123, 'Caprese Salad', 'SALAD003', 'Simple tomato, mozzarella, and basil salad', 2, 10, 0, '1. Slice tomatoes and mozzarella\n2. Arrange alternating slices\n3. Top with fresh basil\n4. Drizzle with balsamic and oil', 'Easy', 'Appetizer', 2.00, 8.99, 1, 1, '2025-12-13 16:00:00', NULL),
(124, 'Beef Stew', 'STEW002', 'Hearty beef and vegetable stew', 4, 30, 120, '1. Brown beef cubes\n2. Add vegetables and broth\n3. Simmer for 2 hours\n4. Thicken with flour slurry if desired', 'Medium', 'Main Course', 4.00, 16.99, 1, 1, '2025-12-13 16:00:00', NULL),
(125, 'Apple Pie', 'DESSERT003', 'Classic American apple pie', 8, 40, 50, '1. Prepare pie crust\n2. Fill with spiced apples\n3. Top with crust or crumble\n4. Bake until golden brown', 'Medium', 'Dessert', 2.20, 19.99, 1, 1, '2025-12-13 16:00:00', NULL),
(126, 'Fried Rice', 'ASIAN001', 'Vegetable fried rice with eggs', 4, 15, 15, '1. Cook rice and cool\n2. Scramble eggs in wok\n3. Add vegetables and rice\n4. Season with soy sauce\n5. Garnish with green onions', 'Easy', 'Main Course', 2.00, 11.99, 1, 1, '2025-12-13 16:00:00', NULL),
(127, 'Spinach Dip', 'DIP002', 'Creamy spinach and artichoke dip', 6, 15, 25, '1. Mix cream cheese and sour cream\n2. Add spinach and artichokes\n3. Bake until bubbly\n4. Serve with bread or chips', 'Easy', 'Appetizer', 1.50, 8.99, 1, 1, '2025-12-13 16:00:00', NULL),
(128, 'Lemonade', 'BEV002', 'Fresh squeezed lemonade', 4, 10, 0, '1. Juice lemons\n2. Make simple syrup\n3. Combine with water\n4. Chill and serve over ice', 'Easy', 'Beverage', 0.50, 4.99, 1, 1, '2025-12-13 16:00:00', NULL),
(129, 'Fish Tacos', 'MEX002', 'Grilled fish in soft tortillas', 2, 20, 10, '1. Season and grill fish\n2. Warm tortillas\n3. Prepare slaw and sauce\n4. Assemble tacos with toppings', 'Easy', 'Main Course', 4.00, 14.99, 1, 1, '2025-12-13 16:00:00', NULL),
(130, 'Roast Chicken', 'MEAT002', 'Herb roasted whole chicken', 4, 20, 90, '1. Season chicken inside and out\n2. Stuff with herbs and lemon\n3. Roast at 375°F until golden\n4. Rest before carving', 'Medium', 'Main Course', 4.50, 22.99, 1, 1, '2025-12-13 16:00:00', NULL),
(131, 'Tiramisu', 'DESSERT004', 'Classic Italian coffee dessert', 8, 30, 0, '1. Make coffee mixture\n2. Beat mascarpone and cream\n3. Layer ladyfingers and cream\n4. Chill overnight\n5. Dust with cocoa', 'Medium', 'Dessert', 3.00, 22.99, 1, 1, '2025-12-13 16:00:00', NULL),
(132, 'Minestrone Soup', 'SOUP003', 'Italian vegetable soup', 6, 25, 45, '1. Sauté vegetables\n2. Add broth and tomatoes\n3. Simmer with beans and pasta\n4. Season with herbs', 'Easy', 'Main Course', 2.20, 10.99, 1, 1, '2025-12-13 16:00:00', NULL),
(133, 'Quesadilla', 'MEX003', 'Cheese and chicken quesadilla', 2, 10, 10, '1. Cook chicken and shred\n2. Fill tortilla with cheese and chicken\n3. Cook on griddle until golden\n4. Cut into wedges', 'Easy', 'Appetizer', 2.00, 9.99, 1, 1, '2025-12-13 16:00:00', NULL),
(134, 'Cheesecake', 'DESSERT005', 'New York style cheesecake', 10, 30, 60, '1. Make graham cracker crust\n2. Beat cream cheese until smooth\n3. Add eggs one at a time\n4. Bake in water bath\n5. Chill overnight', 'Hard', 'Dessert', 3.50, 26.99, 1, 1, '2025-12-13 16:00:00', NULL),
(135, 'Pulled Pork', 'MEAT003', 'Slow cooked BBQ pulled pork', 8, 30, 480, '1. Season pork shoulder\n2. Slow cook until tender\n3. Shred meat\n4. Mix with BBQ sauce', 'Medium', 'Main Course', 3.00, 17.99, 1, 1, '2025-12-13 16:00:00', NULL),
(136, 'French Onion Soup', 'SOUP004', 'Caramelized onion soup with cheese', 2, 20, 60, '1. Caramelize onions slowly\n2. Add broth and simmer\n3. Ladle into bowls\n4. Top with bread and cheese\n5. Broil until bubbly', 'Medium', 'Appetizer', 2.80, 11.99, 1, 1, '2025-12-13 16:00:00', NULL),
(137, 'Pad Thai', 'ASIAN002', 'Thai stir-fried noodles', 2, 30, 15, '1. Soak rice noodles\n2. Stir-fry protein and vegetables\n3. Add noodles and sauce\n4. Garnish with peanuts and lime', 'Medium', 'Main Course', 4.50, 15.99, 1, 1, '2025-12-13 16:00:00', NULL),
(138, 'Hummus', 'DIP003', 'Chickpea and tahini dip', 6, 15, 0, '1. Blend chickpeas and tahini\n2. Add lemon juice and garlic\n3. Stream in olive oil\n4. Season with cumin and salt', 'Easy', 'Appetizer', 1.20, 7.99, 1, 1, '2025-12-13 16:00:00', NULL),
(139, 'Risotto', 'ITALIAN001', 'Creamy mushroom risotto', 4, 40, 25, '1. Sauté mushrooms and onions\n2. Toast Arborio rice\n3. Add hot broth gradually\n4. Stir constantly until creamy\n5. Finish with butter and Parmesan', 'Hard', 'Main Course', 4.00, 18.99, 1, 1, '2025-12-13 16:00:00', NULL),
(140, 'Brownies', 'DESSERT006', 'Fudgy chocolate brownies', 12, 15, 30, '1. Melt butter and chocolate\n2. Whisk in sugar and eggs\n3. Fold in flour and cocoa\n4. Bake at 350°F for 30 minutes\n5. Cool before cutting', 'Easy', 'Dessert', 0.80, 3.99, 1, 1, '2025-12-13 16:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `recipe_ingredients`
--

CREATE TABLE `recipe_ingredients` (
  `recipe_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  `quantity` decimal(10,3) NOT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ;

--
-- Dumping data for table `recipe_ingredients`
--

INSERT INTO `recipe_ingredients` (`recipe_id`, `ingredient_id`, `quantity`, `notes`, `created_at`, `updated_at`) VALUES
(1, 6, 1.000, 'test', '2025-12-14 17:29:56', NULL),
(1, 9, 2.000, 'drink', '2025-12-14 17:29:56', NULL),
(101, 106, 0.005, 'Salt', '2025-12-13 16:00:00', NULL),
(101, 124, 0.020, 'Ketchup', '2025-12-13 16:00:00', NULL),
(101, 126, 0.250, 'Ground beef patty', '2025-12-13 16:00:00', NULL),
(101, 140, 0.050, 'Lettuce leaf', '2025-12-13 16:00:00', NULL),
(101, 142, 0.100, 'Tomato slice', '2025-12-13 16:00:00', NULL),
(101, 159, 1.000, 'Burger bun', '2025-12-13 16:00:00', NULL),
(102, 123, 0.050, 'Mayonnaise for dressing', '2025-12-13 16:00:00', NULL),
(102, 136, 0.030, 'Parmesan cheese', '2025-12-13 16:00:00', NULL),
(102, 140, 0.200, 'Romaine lettuce', '2025-12-13 16:00:00', NULL),
(102, 144, 0.010, 'Garlic clove', '2025-12-13 16:00:00', NULL),
(102, 180, 0.010, 'Anchovy fillet', '2025-12-13 16:00:00', NULL),
(103, 126, 0.200, 'Ground beef', '2025-12-13 16:00:00', NULL),
(103, 136, 0.020, 'Parmesan cheese', '2025-12-13 16:00:00', NULL),
(103, 143, 0.050, 'Onion', '2025-12-13 16:00:00', NULL),
(103, 144, 0.010, 'Garlic', '2025-12-13 16:00:00', NULL),
(103, 158, 0.150, 'Spaghetti pasta', '2025-12-13 16:00:00', NULL),
(103, 163, 0.100, 'Tomato sauce', '2025-12-13 16:00:00', NULL),
(104, 125, 0.200, 'Chicken breast', '2025-12-13 16:00:00', NULL),
(104, 132, 0.100, 'Heavy cream', '2025-12-13 16:00:00', NULL),
(104, 133, 0.030, 'Butter', '2025-12-13 16:00:00', NULL),
(104, 136, 0.040, 'Parmesan cheese', '2025-12-13 16:00:00', NULL),
(104, 158, 0.150, 'Fettuccine pasta', '2025-12-13 16:00:00', NULL),
(105, 101, 0.150, 'All-purpose flour', '2025-12-13 16:00:00', NULL),
(105, 102, 0.080, 'Granulated sugar', '2025-12-13 16:00:00', NULL),
(105, 103, 0.080, 'Brown sugar', '2025-12-13 16:00:00', NULL),
(105, 113, 0.005, 'Vanilla extract', '2025-12-13 16:00:00', NULL),
(105, 133, 0.100, 'Butter', '2025-12-13 16:00:00', NULL),
(105, 134, 1.000, 'Egg', '2025-12-13 16:00:00', NULL),
(105, 174, 0.100, 'Chocolate chips', '2025-12-13 16:00:00', NULL),
(106, 111, 0.002, 'Cinnamon', '2025-12-13 16:00:00', NULL),
(106, 131, 0.100, 'Milk', '2025-12-13 16:00:00', NULL),
(106, 133, 0.020, 'Butter for cooking', '2025-12-13 16:00:00', NULL),
(106, 134, 2.000, 'Eggs', '2025-12-13 16:00:00', NULL),
(106, 159, 2.000, 'Bread slices', '2025-12-13 16:00:00', NULL),
(107, 117, 0.020, 'Soy sauce', '2025-12-13 16:00:00', NULL),
(107, 145, 0.100, 'Carrots', '2025-12-13 16:00:00', NULL),
(107, 146, 0.050, 'Celery', '2025-12-13 16:00:00', NULL),
(107, 148, 0.100, 'Bell peppers', '2025-12-13 16:00:00', NULL),
(107, 149, 0.080, 'Mushrooms', '2025-12-13 16:00:00', NULL),
(107, 157, 0.150, 'Rice', '2025-12-13 16:00:00', NULL),
(108, 129, 0.200, 'Salmon fillet', '2025-12-13 16:00:00', NULL),
(108, 150, 0.020, 'Lemon juice', '2025-12-13 16:00:00', NULL),
(108, 195, 0.003, 'Oregano', '2025-12-13 16:00:00', NULL),
(108, 196, 0.003, 'Basil', '2025-12-13 16:00:00', NULL),
(109, 132, 0.050, 'Heavy cream', '2025-12-13 16:00:00', NULL),
(109, 143, 0.050, 'Onion', '2025-12-13 16:00:00', NULL),
(109, 144, 0.010, 'Garlic', '2025-12-13 16:00:00', NULL),
(109, 163, 0.200, 'Tomato sauce', '2025-12-13 16:00:00', NULL),
(109, 196, 0.003, 'Basil', '2025-12-13 16:00:00', NULL),
(110, 142, 0.050, 'Tomato', '2025-12-13 16:00:00', NULL),
(110, 143, 0.020, 'Onion', '2025-12-13 16:00:00', NULL),
(110, 151, 0.010, 'Lime juice', '2025-12-13 16:00:00', NULL),
(110, 182, 0.150, 'Avocado base', '2025-12-13 16:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(50) NOT NULL,
  `permissions` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_id`, `role_name`, `permissions`, `created_at`) VALUES
(1, 'Administrator', '{\"all\": true}', '2025-12-14 10:51:48'),
(2, 'Manager', '{\"recipes\": \"rw\", \"inventory\": \"rw\", \"purchase\": \"rw\", \"reports\": \"r\"}', '2025-12-14 10:51:48'),
(3, 'Kitchen Staff', '{\"recipes\": \"r\", \"inventory\": \"r\", \"production\": \"w\"}', '2025-12-14 10:51:48');

-- --------------------------------------------------------

--
-- Table structure for table `stock_transactions`
--

CREATE TABLE `stock_transactions` (
  `transaction_id` int(11) NOT NULL,
  `transaction_date` datetime NOT NULL DEFAULT current_timestamp(),
  `type_id` int(11) NOT NULL,
  `reference_number` varchar(50) DEFAULT NULL,
  `reference_type` enum('PURCHASE','RECIPE_USAGE','ADJUSTMENT','WASTAGE','OTHER') DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stock_transactions`
--

INSERT INTO `stock_transactions` (`transaction_id`, `transaction_date`, `type_id`, `reference_number`, `reference_type`, `description`, `created_by`, `created_at`) VALUES
(1, '2025-12-15 01:12:26', 1, NULL, 'ADJUSTMENT', 'Manual stock addition: 10 - i wanted to test this out', 1, '2025-12-14 17:12:26'),
(2, '2025-12-15 01:12:48', 1, NULL, 'ADJUSTMENT', 'Manual stock addition: 100 - running low', 1, '2025-12-14 17:12:48');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `supplier_id` int(11) NOT NULL,
  `supplier_name` varchar(100) NOT NULL,
  `contact_person` varchar(100) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `payment_terms` varchar(50) DEFAULT NULL,
  `is_preferred` tinyint(1) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`supplier_id`, `supplier_name`, `contact_person`, `phone_number`, `email`, `address`, `payment_terms`, `is_preferred`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Fresh Farms Produce', 'Sarah Green', '555-0101', 'orders@freshfarms.com', NULL, NULL, 1, 1, '2025-12-14 15:56:01', NULL),
(2, 'Meat Masters Inc.', 'Bob Butcher', '555-0102', 'sales@meatmasters.com', NULL, NULL, 1, 1, '2025-12-14 15:56:01', NULL),
(3, 'Global Restaurant Depot', 'Jim Sales', '555-0103', 'support@grd.com', NULL, NULL, 0, 1, '2025-12-14 15:56:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `system_backups`
--

CREATE TABLE `system_backups` (
  `backup_id` int(11) NOT NULL,
  `backup_type` enum('AUTO','MANUAL') NOT NULL,
  `backup_name` varchar(100) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `file_size_mb` decimal(6,2) DEFAULT NULL,
  `backup_date` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `restored` tinyint(1) NOT NULL DEFAULT 0,
  `restored_date` datetime DEFAULT NULL,
  `restored_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system_logs`
--

CREATE TABLE `system_logs` (
  `log_id` int(11) NOT NULL,
  `log_date` datetime NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) DEFAULT NULL,
  `action_type` varchar(50) NOT NULL,
  `table_name` varchar(50) DEFAULT NULL,
  `record_id` int(11) DEFAULT NULL,
  `description` text NOT NULL,
  `ip_address` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `system_logs`
--

INSERT INTO `system_logs` (`log_id`, `log_date`, `user_id`, `action_type`, `table_name`, `record_id`, `description`, `ip_address`) VALUES
(1, '2025-12-15 01:01:48', 1, 'LOGIN', 'users', 1, 'User logged in', '::1'),
(2, '2025-12-15 01:10:25', 1, 'CREATE', 'ingredients', 9, 'Created new ingredient: Mommy milkers', '::1'),
(3, '2025-12-15 01:10:34', 1, 'UPDATE', 'ingredients', 8, 'Updated ingredient: minecraft', '::1'),
(4, '2025-12-15 01:10:41', 1, 'UPDATE', 'ingredients', 6, 'Updated ingredient: test', '::1'),
(5, '2025-12-15 01:10:49', 1, 'DELETE', 'ingredients', 8, 'Deleted ingredient', '::1'),
(6, '2025-12-15 01:10:56', 1, 'DELETE', 'ingredients', 8, 'Deleted ingredient', '::1'),
(7, '2025-12-15 01:12:26', 1, 'UPDATE', 'inventory', 6, 'Stock adjusted: Manual stock addition: 10 - i wanted to test this out', '::1'),
(8, '2025-12-15 01:12:48', 1, 'UPDATE', 'inventory', 9, 'Stock adjusted: Manual stock addition: 100 - running low', '::1'),
(9, '2025-12-15 01:16:48', 1, 'LOGOUT', 'users', 1, 'User logged out', '::1'),
(10, '2025-12-15 01:17:03', 1, 'LOGIN', 'users', 1, 'User logged in', '::1'),
(11, '2025-12-15 01:17:28', 1, 'LOGOUT', 'users', 1, 'User logged out', '::1'),
(12, '2025-12-15 01:17:31', 1, 'LOGIN', 'users', 1, 'User logged in', '::1'),
(13, '2025-12-15 01:17:33', 1, 'LOGOUT', 'users', 1, 'User logged out', '::1'),
(14, '2025-12-15 01:17:49', 1, 'LOGIN', 'users', 1, 'User logged in', '::1'),
(15, '2025-12-15 01:29:56', 1, 'CREATE', 'recipes', 1, 'Recipe: truffle', '::1'),
(16, '2025-12-15 01:31:43', 1, 'LOGOUT', 'users', 1, 'User logged out', '::1'),
(17, '2025-12-15 01:32:27', 1, 'LOGIN', 'users', 1, 'User logged in', '::1'),
(18, '2025-12-15 01:36:12', 1, 'CREATE', 'users', 4, 'User: 123123', '::1'),
(19, '2025-12-15 01:36:24', 1, 'LOGOUT', 'users', 1, 'User logged out', '::1'),
(20, '2025-12-15 01:36:28', 4, 'LOGIN', 'users', 4, 'User logged in', '::1'),
(21, '2025-12-15 01:36:51', 4, 'LOGOUT', 'users', 4, 'User logged out', '::1'),
(22, '2025-12-15 01:36:53', 1, 'LOGIN', 'users', 1, 'User logged in', '::1'),
(23, '2025-12-15 06:34:32', 1, 'LOGIN', 'users', 1, 'User logged in', '::1'),
(24, '2025-12-15 07:13:14', 1, 'LOGOUT', 'users', 1, 'User logged out', '::1'),
(25, '2025-12-15 07:13:16', 1, 'LOGIN', 'users', 1, 'User logged in', '::1'),
(26, '2025-12-15 07:46:25', 1, 'LOGIN', 'users', 1, 'User logged in', '::1'),
(27, '2025-12-15 11:35:29', 1, 'LOGIN', 'users', 1, 'User logged in', '::1'),
(28, '2025-12-15 11:36:59', 1, 'DELETE', 'ingredients', 8, 'Deleted ingredient', '::1'),
(29, '2025-12-15 12:55:00', 1, 'LOGIN', 'users', 1, 'User logged in', '::1'),
(30, '2025-12-15 12:59:41', 1, 'CREATE', 'purchase_orders', 1, 'PO: PO-20251215-1984', '::1');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_details`
--

CREATE TABLE `transaction_details` (
  `detail_id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  `quantity` decimal(10,3) NOT NULL,
  `unit_cost` decimal(10,2) DEFAULT NULL,
  `total_cost` decimal(10,2) DEFAULT NULL,
  `batch_number` varchar(50) DEFAULT NULL,
  `expiry_date` date DEFAULT NULL
) ;

--
-- Dumping data for table `transaction_details`
--

INSERT INTO `transaction_details` (`detail_id`, `transaction_id`, `ingredient_id`, `quantity`, `unit_cost`, `total_cost`, `batch_number`, `expiry_date`) VALUES
(1, 1, 6, 10.000, NULL, NULL, NULL, NULL),
(2, 2, 9, 100.000, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transaction_types`
--

CREATE TABLE `transaction_types` (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(50) NOT NULL,
  `type_code` varchar(10) NOT NULL,
  `stock_effect` enum('INCREASE','DECREASE','NEUTRAL') NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_types`
--

INSERT INTO `transaction_types` (`type_id`, `type_name`, `type_code`, `stock_effect`, `description`) VALUES
(1, 'Purchase', 'PUR', 'INCREASE', 'Stock in from supplier purchase'),
(2, 'Recipe Usage', 'USE', 'DECREASE', 'Stock out for recipe preparation'),
(3, 'Manual Adjustment', 'ADJ', 'NEUTRAL', 'Manual stock correction'),
(4, 'Wastage', 'WST', 'DECREASE', 'Stock loss due to spoilage/damage'),
(5, 'Transfer', 'TRF', 'NEUTRAL', 'Transfer between locations (future)');

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `unit_id` int(11) NOT NULL,
  `unit_name` varchar(50) NOT NULL,
  `unit_abbreviation` varchar(10) NOT NULL,
  `unit_type` enum('weight','volume','count','other') NOT NULL DEFAULT 'other',
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`unit_id`, `unit_name`, `unit_abbreviation`, `unit_type`, `is_active`, `created_at`) VALUES
(1, 'Kilogram', 'kg', 'weight', 1, '2025-12-14 10:51:48'),
(2, 'Gram', 'g', 'weight', 1, '2025-12-14 10:51:48'),
(3, 'Liter', 'L', 'volume', 1, '2025-12-14 10:51:48'),
(4, 'Milliliter', 'mL', 'volume', 1, '2025-12-14 10:51:48'),
(5, 'Piece', 'pc', 'count', 1, '2025-12-14 10:51:48'),
(6, 'Package', 'pkg', 'count', 1, '2025-12-14 10:51:48'),
(7, 'Bunch', 'bunch', 'count', 1, '2025-12-14 10:51:48'),
(8, 'Cup', 'cup', 'volume', 1, '2025-12-14 10:51:48'),
(9, 'Tablespoon', 'tbsp', 'volume', 1, '2025-12-14 10:51:48'),
(10, 'Teaspoon', 'tsp', 'volume', 1, '2025-12-14 10:51:48');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `last_login` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password_hash`, `role_id`, `full_name`, `email`, `is_active`, `last_login`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2y$10$2Wkkkzc92NTx8a6diMliIOpkU8Cd5JTZZU6BMfMnGbssXsZ4AHh.2', 1, 'System Administrator', 'admin@restaurant.local', 1, '2025-12-15 12:55:00', '2025-12-14 10:51:48', '2025-12-15 04:55:00'),
(4, '123123', '$2y$10$pNrVds1JL1rZZC3Isi9EBeO1ZoABmf7sLpefPRbs3Tl1i/o9JNfSm', 3, 'trix justin', 'holybagelguy@gmail.com', 1, '2025-12-15 01:36:28', '2025-12-14 17:36:12', '2025-12-14 17:36:28');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ingredients`
--
ALTER TABLE `ingredients`
  ADD PRIMARY KEY (`ingredient_id`),
  ADD UNIQUE KEY `uk_ingredient_name` (`ingredient_name`),
  ADD KEY `fk_ingredients_unit_id` (`unit_id`),
  ADD KEY `fk_ingredients_supplier_id` (`supplier_id`),
  ADD KEY `fk_ingredients_created_by` (`created_by`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`inventory_id`),
  ADD UNIQUE KEY `uk_ingredient_stock` (`ingredient_id`),
  ADD KEY `fk_inventory_updated_by` (`updated_by`);

--
-- Indexes for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  ADD PRIMARY KEY (`po_id`),
  ADD UNIQUE KEY `uk_po_number` (`po_number`),
  ADD KEY `fk_purchase_orders_supplier_id` (`supplier_id`),
  ADD KEY `fk_purchase_orders_created_by` (`created_by`);

--
-- Indexes for table `purchase_order_details`
--
ALTER TABLE `purchase_order_details`
  ADD PRIMARY KEY (`po_detail_id`),
  ADD KEY `fk_purchase_order_details_po_id` (`po_id`),
  ADD KEY `fk_purchase_order_details_ingredient_id` (`ingredient_id`);

--
-- Indexes for table `recipes`
--
ALTER TABLE `recipes`
  ADD PRIMARY KEY (`recipe_id`),
  ADD UNIQUE KEY `uk_recipe_name` (`recipe_name`),
  ADD UNIQUE KEY `uk_recipe_code` (`recipe_code`),
  ADD KEY `fk_recipes_created_by` (`created_by`);

--
-- Indexes for table `recipe_ingredients`
--
ALTER TABLE `recipe_ingredients`
  ADD PRIMARY KEY (`recipe_id`,`ingredient_id`),
  ADD KEY `fk_recipe_ingredients_ingredient_id` (`ingredient_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`),
  ADD UNIQUE KEY `uk_role_name` (`role_name`);

--
-- Indexes for table `stock_transactions`
--
ALTER TABLE `stock_transactions`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `idx_transaction_date` (`transaction_date`),
  ADD KEY `fk_stock_transactions_type_id` (`type_id`),
  ADD KEY `fk_stock_transactions_created_by` (`created_by`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`supplier_id`),
  ADD UNIQUE KEY `uk_supplier_name` (`supplier_name`);

--
-- Indexes for table `system_backups`
--
ALTER TABLE `system_backups`
  ADD PRIMARY KEY (`backup_id`),
  ADD KEY `fk_backups_created_by` (`created_by`),
  ADD KEY `fk_backups_restored_by` (`restored_by`);

--
-- Indexes for table `system_logs`
--
ALTER TABLE `system_logs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `idx_log_date` (`log_date`),
  ADD KEY `idx_user_action` (`user_id`,`action_type`);

--
-- Indexes for table `transaction_details`
--
ALTER TABLE `transaction_details`
  ADD PRIMARY KEY (`detail_id`),
  ADD KEY `fk_transaction_details_transaction_id` (`transaction_id`),
  ADD KEY `fk_transaction_details_ingredient_id` (`ingredient_id`);

--
-- Indexes for table `transaction_types`
--
ALTER TABLE `transaction_types`
  ADD PRIMARY KEY (`type_id`),
  ADD UNIQUE KEY `uk_type_code` (`type_code`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`unit_id`),
  ADD UNIQUE KEY `uk_unit_name` (`unit_name`),
  ADD UNIQUE KEY `uk_unit_abbr` (`unit_abbreviation`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `uk_username` (`username`),
  ADD KEY `fk_users_role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ingredients`
--
ALTER TABLE `ingredients`
  MODIFY `ingredient_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `inventory_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  MODIFY `po_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_order_details`
--
ALTER TABLE `purchase_order_details`
  MODIFY `po_detail_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `recipes`
--
ALTER TABLE `recipes`
  MODIFY `recipe_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_transactions`
--
ALTER TABLE `stock_transactions`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `supplier_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `system_backups`
--
ALTER TABLE `system_backups`
  MODIFY `backup_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `system_logs`
--
ALTER TABLE `system_logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `transaction_details`
--
ALTER TABLE `transaction_details`
  MODIFY `detail_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transaction_types`
--
ALTER TABLE `transaction_types`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `unit_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ingredients`
--
ALTER TABLE `ingredients`
  ADD CONSTRAINT `fk_ingredients_created_by` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ingredients_supplier_id` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`supplier_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ingredients_unit_id` FOREIGN KEY (`unit_id`) REFERENCES `units` (`unit_id`) ON UPDATE CASCADE;

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `fk_inventory_ingredient_id` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`ingredient_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_inventory_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE;

--
-- Constraints for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  ADD CONSTRAINT `fk_purchase_orders_created_by` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_purchase_orders_supplier_id` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`supplier_id`) ON UPDATE CASCADE;

--
-- Constraints for table `purchase_order_details`
--
ALTER TABLE `purchase_order_details`
  ADD CONSTRAINT `fk_purchase_order_details_ingredient_id` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`ingredient_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_purchase_order_details_po_id` FOREIGN KEY (`po_id`) REFERENCES `purchase_orders` (`po_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `recipes`
--
ALTER TABLE `recipes`
  ADD CONSTRAINT `fk_recipes_created_by` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE;

--
-- Constraints for table `recipe_ingredients`
--
ALTER TABLE `recipe_ingredients`
  ADD CONSTRAINT `fk_recipe_ingredients_ingredient_id` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`ingredient_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_recipe_ingredients_recipe_id` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`recipe_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `stock_transactions`
--
ALTER TABLE `stock_transactions`
  ADD CONSTRAINT `fk_stock_transactions_created_by` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_stock_transactions_type_id` FOREIGN KEY (`type_id`) REFERENCES `transaction_types` (`type_id`) ON UPDATE CASCADE;

--
-- Constraints for table `system_backups`
--
ALTER TABLE `system_backups`
  ADD CONSTRAINT `fk_backups_created_by` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_backups_restored_by` FOREIGN KEY (`restored_by`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `system_logs`
--
ALTER TABLE `system_logs`
  ADD CONSTRAINT `fk_system_logs_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `transaction_details`
--
ALTER TABLE `transaction_details`
  ADD CONSTRAINT `fk_transaction_details_ingredient_id` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`ingredient_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_transaction_details_transaction_id` FOREIGN KEY (`transaction_id`) REFERENCES `stock_transactions` (`transaction_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_role_id` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
