-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 15, 2018 at 09:57 PM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `video_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `categoryId` int(11) NOT NULL,
  `name` text NOT NULL,
  `categoryDesc` text NOT NULL,
  `defaultCategory` int(11) NOT NULL DEFAULT '0',
  `defaultVideo` int(11) NOT NULL,
  `thumbnailSrc` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`categoryId`, `name`, `categoryDesc`, `defaultCategory`, `defaultVideo`, `thumbnailSrc`) VALUES
(12, 'Adventure', 'Adventure', 0, 802, '/videos/genre/poster/adventure.jpg'),
(28, 'Action', 'Action', 0, 802, '/videos/genre/poster/action.jpg'),
(878, 'Science Fiction', 'Science Fiction', 0, 802, '/videos/genre/poster/scifi.jpg'),
(10749, 'Romance', 'Romance', 0, 802, '/videos/genre/poster/romance.jpg'),
(9648, 'Mystery', 'Mystery', 0, 802, '/videos/genre/poster/mystery.jpg'),
(10402, 'Music', 'Music', 0, 802, '/videos/genre/poster/music.jpg'),
(27, 'Horror', 'Horror', 0, 802, '/videos/genre/poster/horror.jpg'),
(36, 'History', 'History', 0, 802, '/videos/genre/poster/history.jpg'),
(14, 'Fantasy', 'Fantasy', 0, 802, '/videos/genre/poster/fantasy.jpg'),
(10751, 'Family', 'Family', 0, 802, '/videos/genre/poster/family.jpg'),
(18, 'Drama', 'Drama', 0, 802, '/videos/genre/poster/drama.jpg'),
(99, 'Documentary', 'Documentary', 0, 802, '/videos/genre/poster/documentary.jpg'),
(80, 'Crime', 'Crime', 0, 802, '/videos/genre/poster/crime.jpg'),
(35, 'Comedy', 'Comedy', 0, 802, '/videos/genre/poster/comedy.jpg'),
(16, 'Animation', 'Animation', 0, 802, '/videos/genre/poster/animation.jpg'),
(10770, 'TV Movie', 'TV Movie', 0, 802, '/videos/genre/poster/tv.jpg'),
(53, 'Thriller', 'Thriller', 0, 802, '/videos/genre/poster/thriller.jpg'),
(10752, 'War', 'War', 0, 802, '/videos/genre/poster/war.jpg'),
(37, 'Western', 'Western', 0, 802, '/videos/genre/poster/western.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `videoId` int(255) NOT NULL,
  `title` text NOT NULL,
  `duration` int(155) NOT NULL,
  `videoSrc` varchar(255) NOT NULL,
  `posterSrc` varchar(255) NOT NULL,
  `thumbnailSrc` varchar(255) NOT NULL,
  `category` json NOT NULL,
  `ageLimit` int(155) NOT NULL,
  `videoDesc` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `videos`
--

INSERT INTO `videos` (`videoId`, `title`, `duration`, `videoSrc`, `posterSrc`, `thumbnailSrc`, `category`, `ageLimit`, `videoDesc`) VALUES
(643, 'San Andreas', 120, '', '/videos/poster/cUfGqafAVQkatQ7N4y08RNV3bgu.jpg', '/videos/thumbnail/qey0tdcOp9kCDdEZuJ87yE3crSe.jpg', '[28, 18, 53]', 0, 'In the aftermath of a massive earthquake in California, a rescue-chopper pilot makes a dangerous journey across the state in order to rescue his estranged daughter.'),
(644, 'Avengers: Age of Ultron', 120, '', '/videos/poster/vXIrvKadue7GdySiVh3huoQZiMi.jpg', '/videos/thumbnail/t90Y3G8UGQp0f0DrP60wRu9gfrH.jpg', '[28, 12, 878]', 0, 'When Tony Stark tries to jumpstart a dormant peacekeeping program, things go awry and Earth’s Mightiest Heroes are put to the ultimate test as the fate of the planet hangs in the balance. As the villainous Ultron emerges, it is up to The Avengers to stop him from enacting his terrible plans, and soon uneasy alliances and unexpected action pave the way for an epic and unique global adventure.'),
(645, 'Star Wars: The Force Awakens', 120, '', '/videos/poster/njv65RTipNSTozFLuF85jL0bcQe.jpg', '/videos/thumbnail/weUSwMdQIa3NaXVzwUoIIcAi85d.jpg', '[28, 12, 878, 14]', 0, 'Thirty years after defeating the Galactic Empire, Han Solo and his allies face a new threat from the evil Kylo Ren and his army of Stormtroopers.'),
(646, 'Valerian and the City of a Thousand Planets', 120, '', '/videos/poster/7WjMTRF6LDa4latRUIDM25xnDO0.jpg', '/videos/thumbnail/jfIpMh79fGRqYJ6PwZLCntzgxlF.jpg', '[12, 878, 28]', 0, 'In the 28th century, Valerian and Laureline are special operatives charged with keeping order throughout the human territories. On assignment from the Minister of Defense, the two undertake a mission to Alpha, an ever-expanding metropolis where species from across the universe have converged over centuries to share knowledge, intelligence, and cultures. At the center of Alpha is a mysterious dark force which threatens the peaceful existence of the City of a Thousand Planets, and Valerian and Laureline must race to identify the menace and safeguard not just Alpha, but the future of the universe.'),
(647, 'Gone Girl', 120, '', '/videos/poster/bt6DhdALyhf90gReozoQ0y3R3vZ.jpg', '/videos/thumbnail/gdiLTof3rbPDAmPaCf4g6op46bj.jpg', '[9648, 53, 18]', 0, 'With his wife\'s disappearance having become the focus of an intense media circus, a man sees the spotlight turned on him when it\'s suspected that he may not be innocent.'),
(648, 'The Lord of the Rings: The Fellowship of the Ring', 120, '', '/videos/poster/pIUvQ9Ed35wlWhY2oU6OmwEsmzG.jpg', '/videos/thumbnail/bi9JddwTwBt3ixGLAiMAF7OXMbV.jpg', '[12, 14, 28]', 0, 'Young hobbit Frodo Baggins, after inheriting a mysterious ring from his uncle Bilbo, must leave his home in order to keep it from falling into the hands of its evil creator. Along the way, a fellowship is formed to protect the ringbearer and make sure that the ring arrives at its final destination: Mt. Doom, the only place where it can be destroyed.'),
(649, 'Insurgent', 120, '', '/videos/poster/L5QRL1O3fGs2hH1LbtYyVl8Tce.jpg', '/videos/thumbnail/6w1VjTPTjTaA5oNvsAg0y4H6bou.jpg', '[28, 12, 878, 53]', 0, 'Beatrice Prior must confront her inner demons and continue her fight against a powerful alliance which threatens to tear her society apart.'),
(650, 'The Imitation Game', 120, '', '/videos/poster/fii9tPZTpy75qOCJBulWOb0ifGp.jpg', '/videos/thumbnail/noUp0XOqIcmgefRnRZa1nhtRvWO.jpg', '[36, 18, 53, 10752]', 0, 'Based on the real life story of legendary cryptanalyst Alan Turing, the film portrays the nail-biting race against time by Turing and his brilliant team of code-breakers at Britain\'s top-secret Government Code and Cypher School at Bletchley Park, during the darkest days of World War II.'),
(651, 'Wonder', 120, '', '/videos/poster/4rsrxYDfIzvtAsIE9wevxPRXAk4.jpg', '/videos/thumbnail/ouYgAatYH4JzIThj6FI3UYf31RI.jpg', '[18]', 0, 'The story of August Pullman – a boy with facial differences – who enters fifth grade, attending a mainstream elementary school for the first time.'),
(652, 'Spectre', 120, '', '/videos/poster/wVTYlkKPKrljJfugXN7UlLNjtuJ.jpg', '/videos/thumbnail/hE24GYddaxB9MVZl1CaiI86M3kp.jpg', '[28, 12, 80]', 0, 'A cryptic message from Bond’s past sends him on a trail to uncover a sinister organization. While M battles political forces to keep the secret service alive, Bond peels back the layers of deceit to reveal the terrible truth behind SPECTRE.'),
(653, 'Ant-Man', 120, '', '/videos/poster/kvXLZqY0Ngl1XSw7EaMQO0C1CCj.jpg', '/videos/thumbnail/D6e8RJf2qUstnfkTslTXNTUAlT.jpg', '[878, 28, 12]', 0, 'Armed with the astonishing ability to shrink in scale but increase in strength, master thief Scott Lang must embrace his inner-hero and help his mentor, Doctor Hank Pym, protect the secret behind his spectacular Ant-Man suit from a new generation of towering threats. Against seemingly insurmountable obstacles, Pym and Lang must plan and pull off a heist that will save the world.'),
(654, 'Chappie', 120, '', '/videos/poster/y5lG7TBpeOMG0jxAaTK0ghZSzBJ.jpg', '/videos/thumbnail/saF3HtAduvrP9ytXDxSnQJP3oqx.jpg', '[80, 28, 878]', 0, 'Every child comes into the world full of promise, and none more so than Chappie: he is gifted, special, a prodigy. Like any child, Chappie will come under the influence of his surroundings—some good, some bad—and he will rely on his heart and soul to find his way in the world and become his own man. But there\'s one thing that makes Chappie different from any one else: he is a robot.'),
(655, 'Maze Runner: The Death Cure', 120, '', '/videos/poster/bvbyidkMaBls1LTaIWYY6UmYTaL.jpg', '/videos/thumbnail/7GgZ6DGezkh3szFdvskH5XD4V0t.jpg', '[28, 9648, 878, 53, 12, 14]', 0, 'Thomas leads his group of escaped Gladers on their final and most dangerous mission yet. To save their friends, they must break into the legendary Last City, a WCKD-controlled labyrinth that may turn out to be the deadliest maze of all. Anyone who makes it out alive will get answers to the questions the Gladers have been asking since they first arrived in the maze.'),
(656, 'Tomorrowland', 120, '', '/videos/poster/fQbc5XuB4vWA9gnY1CmyxFaOufF.jpg', '/videos/thumbnail/69Cz9VNQZy39fUE2g0Ggth6SBTM.jpg', '[12, 10751, 9648, 878]', 0, 'Bound by a shared destiny, a bright, optimistic teen bursting with scientific curiosity and a former boy-genius inventor jaded by disillusionment embark on a danger-filled mission to unearth the secrets of an enigmatic place somewhere in time and space that exists in their collective memory as "Tomorrowland."'),
(657, 'A Wrinkle in Time', 120, '', '/videos/poster/zqUaMojohr96itJYCE3W1NauTn7.jpg', '/videos/thumbnail/rSb6B7pwiZbW7In6juYEYjZ4Bsw.jpg', '[12, 878, 10751, 14]', 0, 'After the disappearance of her scientist father, three peculiar beings send Meg, her brother, and her friend to space in order to find him.'),
(658, 'Star Wars', 120, '', '/videos/poster/4iJfYYoQzZcONB9hNzg0J0wWyPH.jpg', '/videos/thumbnail/btTdmkgIvOi0FFip1sPuZI2oQG6.jpg', '[12, 28, 878]', 0, 'Princess Leia is captured and held hostage by the evil Imperial forces in their effort to take over the galactic Empire. Venturesome Luke Skywalker and dashing captain Han Solo team together with the loveable robot duo R2-D2 and C-3PO to rescue the beautiful princess and restore peace and justice in the Empire.'),
(659, 'Captain America: Civil War', 120, '', '/videos/poster/m5O3SZvQ6EgD5XXXLPIP1wLppeW.jpg', '/videos/thumbnail/kSBXou5Ac7vEqKd97wotJumyJvU.jpg', '[12, 28, 878]', 0, 'Following the events of Age of Ultron, the collective governments of the world pass an act designed to regulate all superhuman activity. This polarizes opinion amongst the Avengers, causing two factions to side with Iron Man or Captain America, which causes an epic battle between former allies.'),
(660, 'Teenage Mutant Ninja Turtles', 120, '', '/videos/poster/OqCXGt5nl1cHPeotxCDvXLLe6p.jpg', '/videos/thumbnail/oDL2ryJ0sV2bmjgshVgJb3qzvwp.jpg', '[878, 28, 12, 14, 35]', 0, 'The city needs heroes. Darkness has settled over New York City as Shredder and his evil Foot Clan have an iron grip on everything from the police to the politicians. The future is grim until four unlikely outcast brothers rise from the sewers and discover their destiny as Teenage Mutant Ninja Turtles. The Turtles must work with fearless reporter April and her wise-cracking cameraman Vern Fenwick to save the city and unravel Shredder\'s diabolical plan.'),
(661, 'Dawn of the Planet of the Apes', 120, '', '/videos/poster/kUYha9j3oFgRdSQlROfj61ISjeO.jpg', '/videos/thumbnail/2EUAUIu5lHFlkj5FRryohlH6CRO.jpg', '[878, 28, 18, 53]', 0, 'A group of scientists in San Francisco struggle to stay alive in the aftermath of a plague that is wiping out humanity, while Caesar tries to maintain dominance over his community of intelligent apes.'),
(662, 'Spider-Man: Homecoming', 120, '', '/videos/poster/vc8bCGjdVp0UbMNLzHnHSLRbBWQ.jpg', '/videos/thumbnail/c24sv2weTHPsmDa7jEMN0m2P3RT.jpg', '[28, 12, 35, 878]', 0, 'Following the events of Captain America: Civil War, Peter Parker, with the help of his mentor Tony Stark, tries to balance his life as an ordinary high school student in Queens, New York City, with fighting crime as his superhero alter ego Spider-Man as a new threat, the Vulture, emerges.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`categoryId`),
  ADD KEY `videoId` (`defaultVideo`);

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`videoId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `categoryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10771;
--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `videoId` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=803;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
