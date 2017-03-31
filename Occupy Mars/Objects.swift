//
//  objects.swift
//  Occupy Mars
//
//  Created by Slaght, Brandon on 10/30/16.
//  Copyright © 2016 Slaght, Brandon. All rights reserved.
//

//.geology(mass: <#T##Quantity?#>.gigagram(),
//         volume: <#T##Quantity?#>.kilometer(),
//         equatorial: <#T##Quantity?#>.kilometer(),
//         density: <#T##Quantity?#>.kilogram(),
//         gravity: <#T##Quantity?#>.meter(),
//         escape_velocity: <#T##Quantity?#>.kilometer(),
//         irradiance: <#T##Double?#>,
//         geographic_height_variance: <#T##Quantity?#>.kilometer())
//
//.orbitals(year_length: <#T##Quantity?#>.day(),
//                 perihelion: <#T##Quantity?#>.kilometer(),
//                 aphelion: <#T##Quantity?#>.kilometer(),
//                 velocity: <#T##Quantity?#>.kilometer(),
//                 inclination: <#T##Double?#>,
//                 eccentricity: <#T##Double?#>,
//                 day_length: <#T##Quantity?#>.hour(),
//                 equator_inclination: <#T##Double?#>,
//                 min_distance_from_earth: <#T##Quantity?#>.kilometer(),
//                 max_distance_from_earth: <#T##Quantity?#>.kilometer())
//
//.atmosphere(surface_pressure: <#T##Double?#>,
//                   average_temperature: <#T##Double?#>,
//                   total_mass: <#T##Quantity?#>.kilogram())

import Foundation
import UIKit

class Objects {
    
    static func planets() -> [Class: [Planet]] {
        
        let Mercury = Planet(name: "Mercury",
                             type: Type.Rock, position: 1,
                             classification: Class.Major)
        
        Mercury.about(description: "Mercury is the smallest and innermost planet in the Solar System. Its orbital period (about 88 Earth days) is less than any other planet in the Solar System. Seen from Earth, it appears to move around its orbit in about 116 days. It has no known natural satellites. It is named after the Roman deity Mercury, the messenger to the gods.\n\nPartly because it has almost no atmosphere to retain heat, Mercury's surface temperature varies diurnally more than any other planet in the Solar System, ranging from 100 K (−173 °C; −280 °F) at night to 700 K (427 °C; 800 °F) during the day in some equatorial regions. The poles are constantly below 180 K (−93 °C; −136 °F). Mercury's axis has the smallest tilt of any of the Solar System's planets (about  1/30 degree), and its orbital eccentricity is the largest of all known planets in the Solar System. At aphelion, Mercury is about 1.5 times as far from the Sun as it is at perihelion. Mercury's surface is heavily cratered and similar in appearance to the Moon, indicating that it has been geologically inactive for billions of years.\n\nMercury is tidally or gravitationally locked with the Sun in a 3:2 resonance, and rotates in a way that is unique in the Solar System. As seen relative to the fixed stars, it rotates on its axis exactly three times for every two revolutions it makes around the Sun. As seen from the Sun, in a frame of reference that rotates with the orbital motion, it appears to rotate only once every two Mercurian years. An observer on Mercury would therefore see only one day every two years.\n\nBecause Mercury orbits the Sun within Earth's orbit (as does Venus), it can appear in Earth's sky in the morning or the evening, but not in the middle of the night. Also, like Venus and the Moon, it displays a complete range of phases as it moves around its orbit relative to Earth. Although Mercury can appear as a bright object when viewed from Earth, its proximity to the Sun makes it more difficult to see than Venus. Two spacecraft have visited Mercury: Mariner 10 flew by in 1974 and 1975; and MESSENGER, launched in 2004, orbited Mercury over 4,000 times in four years, before exhausting its fuel and crashing into the planet's surface on April 30, 2015.",
                      wiki: "https://en.wikipedia.org/wiki/Mercury",
                      nasa: "http://solarsystem.nasa.gov/planets/mercury")
        
        Mercury.geology(mass: 330110000.exogram(),
                        volume: 60830000.megameter(),
                        equatorial: 2439.7.kilometer(),
                        density: 5427.kilogram(),
                        gravity: 3.70.meter(),
                        escape_velocity: 4.3.kilometer(),
                        irradiance: 9082.7,
                        geographic_height_variance: 7.kilometer())
        
        Mercury.orbitals(year_length: 87.968.day(),
                         perihelion: 46000000.kilometer(),
                         aphelion: 69820000.kilometer(),
                         velocity: 47.36.kilometer(),
                         inclination: 7,
                         eccentricity: 0.2056,
                         day_length: 4222.6.hour(),
                         equator_inclination: 0.034,
                         min_distance_from_earth: 77300000.kilometer(),
                         max_distance_from_earth: 221900000.kilometer())
        
        Mercury.atmosphere(surface_pressure: 0.000000000000005,
                           average_temperature: 440,
                           total_mass: 10000.kilogram())
        
        Mercury.misc(discovered: "265 B.C.E.")
        
        Mercury.display(texture: "mercurymap.jpg",
                        model: nil,
                        normalmap: nil,
                        ringmap: nil,
                        ring_transparencymap: nil,
                        ring_inner_ratio: nil,
                        ring_outer_ratio: nil)
        
        Mercury.images(images: [
            ("mercury - hollows.jpg", "Hollows on the surface of Mercury as photographed by the Messenger spacecraft."),
            ("mercury - brahms.jpg", "Brahm's crater on Mercury, with a peak at the center caused by the shock of the impact."),
            ("mercury - horizon.jpg", "Mercury's horizon as seen by the Messenger spacecraft."),
            ("mercury - pole.jpg", "The north pole of Mercury.  The craters here never see sunlight and harbor frozen water."),
            ("mercury - transit.jpg", "Due to its orbital frequency and inclination, Mercury transists the sun far more often than Venus, an event which occurs every several years.")])
        
        Mercury.colors(background: "mercurysurface.jpg", color1: "3C3C34" , color2: "CECECE")
        
        //----------------------------------------------------------------------------------------------
        let Venus = Planet(name: "Venus",
                           type: Type.Rock,
                           position: 2,
                           classification: Class.Major)
        
        Venus.about(description: "Venus is the second planet from the Sun, orbiting it every 224.7 Earth days. It has the longest rotation period (243 days) of any planet in the Solar System and rotates in the opposite direction to most other planets. It has no natural satellite. It is named after the Roman goddess of love and beauty. It is the second-brightest natural object in the night sky after the Moon, reaching an apparent magnitude of −4.6, bright enough to cast shadows. Because Venus orbits within Earth's orbit it is an inferior planet and never appears to venture far from the Sun; its maximum angular distance from the Sun (elongation) is 47.8°.\n\nVenus is a terrestrial planet and is sometimes called Earth's 'sister planet' because of their similar size, mass, proximity to the Sun, and bulk composition. It is radically different from Earth in other respects. It has the densest atmosphere of the four terrestrial planets, consisting of more than 96% carbon dioxide. The atmospheric pressure at the planet's surface is 92 times that of Earth, or roughly the pressure found 900 m (3,000 ft) underwater on Earth. Venus is by far the hottest planet in the Solar System, with a mean surface temperature of 735 K (462 °C; 863 °F), even though Mercury is closer to the Sun. Venus is shrouded by an opaque layer of highly reflective clouds of sulfuric acid, preventing its surface from being seen from space in visible light. It may have had water oceans in the past, but these would have vaporized as the temperature rose due to a runaway greenhouse effect. The water has probably photodissociated, and the free hydrogen has been swept into interplanetary space by the solar wind because of the lack of a planetary magnetic field. Venus's surface is a dry desertscape interspersed with slab-like rocks and is periodically resurfaced by volcanism.\n\nAs one of the brightest objects in the sky, Venus has been a major fixture in human culture for as long as records have existed. It has been made sacred to gods of many cultures, and has been a prime inspiration for writers and poets as the 'morning star' and 'evening star'. Venus was the first planet to have its motions plotted across the sky, as early as the second millennium BC, and was a prime target for early interplanetary exploration as the closest planet to Earth. It was the first planet beyond Earth visited by a spacecraft (Mariner 2) in 1962, and the first to be successfully landed on (by Venera 7) in 1970. Venus's thick clouds render observation of its surface impossible in visible light, and the first detailed maps did not emerge until the arrival of the Magellan orbiter in 1991. Plans have been proposed for rovers or more complex missions, but they are hindered by Venus's hostile surface conditions.",
                    wiki: "https://en.wikipedia.org/wiki/Venus",
                    nasa: "http://solarsystem.nasa.gov/planets/venus")
        
        Venus.geology(mass: 4867500.zettagram(),
                      volume: 928430000.megameter(),
                      equatorial: 6051.8.kilometer(),
                      density: 5243.kilogram(),
                      gravity: 8.87.meter(),
                      escape_velocity: 10.36.kilometer(),
                      irradiance: 2601.3,
                      geographic_height_variance: 13.kilometer())
        
        Venus.orbitals(year_length: 224.695.day(),
                       perihelion: 107480000.kilometer(),
                       aphelion: 108940000.kilometer(),
                       velocity: 35.02.kilometer(),
                       inclination: 3.39,
                       eccentricity: 0.0067,
                       day_length: 2802.hour(),
                       equator_inclination: 2.64,
                       min_distance_from_earth: 38200000.kilometer(),
                       max_distance_from_earth: 261000000.kilometer())
        
        Venus.atmosphere(surface_pressure: 92,
                         average_temperature: 737,
                         total_mass: 480000000.petagram())
        
        
        Venus.misc(discovered: "Prehistoric Times")
        
        Venus.display(texture: "venusmap.jpg",
                      model: nil,
                      normalmap: "venusnormalmap.jpg",
                      ringmap: nil,
                      ring_transparencymap: nil,
                      ring_inner_ratio: nil,
                      ring_outer_ratio: nil)
        
        Venus.images(images: [
            ("venus - clouds.jpg", "Although similar in size to Earth, Venus is shrouded by a thick heavy armosphere, which drives surface temeratures past 800 degrees F."),
            ("venus - mountain.jpg", "The Mangellan probe made detailed 3d mappings of Venus using radar to see throught the clouds.  This 3km tall volcano is called Gula Mons."),
            ("venus - transit.jpg", "The transit of Venus happens around twice a century."),
            ("venus - venera13.jpg", "Soviet spacecraft were the first to reach the surface of Venus.  Venera 13 returned color images of the surface."),
            ("venus - venera14.jpg", "Probes sent to the surface only last a few hours due to the harsh conditions.  Here Venera 14 takes another picture of the surface.")])
        
        Venus.colors(background: "venussurface.jpg",
                     color1: "774A36",
                     color2: "F5BF7F")
        
        //----------------------------------------------------------------------------------------------
        let Earth = Planet(name: "Earth",
                           type: Type.Rock,
                           position: 3,
                           classification: Class.Major)
        
        Earth.about(description: "Earth is the third planet from the Sun, the densest planet in the Solar System, the largest of the Solar System's four terrestrial planets, and the only astronomical object known to harbor life.\n\nAccording to radiometric dating and other sources of evidence, Earth formed about 4.54 billion years ago. Earth gravitationally interacts with other objects in space, especially the Sun and the Moon. During one orbit around the Sun, Earth rotates about its axis 366.26 times, creating 365.26 solar days or one sidereal year. Earth's axis of rotation is tilted 23.4° away from the perpendicular of its orbital plane, producing seasonal variations on the planet's surface within a period of one tropical year (365.24 solar days). The Moon is the Earth's only permanent natural satellite; their gravitational interaction causes ocean tides, stabilizes the orientation of Earth's rotational axis, and gradually slows Earth's rotational rate.\n\nEarth's lithosphere is divided into several rigid tectonic plates that migrate across the surface over periods of many millions of years. 71% of Earth's surface is covered with water. The remaining 29% is land mass—consisting of continents and islands—that together has many lakes, rivers, and other sources of water that contribute to the hydrosphere. The majority of Earth's polar regions are covered in ice, including the Antarctic ice sheet and the sea ice of the Arctic ice pack. Earth's interior remains active with a solid iron inner core, a liquid outer core that generates the Earth's magnetic field, and a convecting mantle that drives plate tectonics.\n\nWithin the first billion years of Earth's history, life appeared in the oceans and began to affect the atmosphere and surface, leading to the proliferation of aerobic and anaerobic organisms. Some geological evidence indicates that life may have arisen as much as 4.1 billion years ago. Since then, the combination of Earth's distance from the Sun, physical properties, and geological history have allowed life to evolve and thrive. In the history of the Earth, biodiversity has gone through long periods of expansion, occasionally punctuated by mass extinction events.",
                    wiki: "https://en.wikipedia.org/wiki/Earth",
                    nasa: "http://solarsystem.nasa.gov/planets/earth")
        
        Earth.geology(mass: 5972300.zettagram(),
                      volume: 1081370000.megameter(),
                      equatorial: 6378.137.kilometer(),
                      density: 5514.kilogram(),
                      gravity: 9.798.meter(),
                      escape_velocity: 11.186.kilometer(),
                      irradiance: 1361,
                      geographic_height_variance: 20.4.kilometer())
        
        Earth.orbitals(year_length: 365.242.day(),
                       perihelion: 147090000.kilometer(),
                       aphelion: 152100000.kilometer(),
                       velocity: 29.78.kilometer(),
                       inclination: 0,
                       eccentricity: 0.0167,
                       day_length: 24.hour(),
                       equator_inclination: 23.44,
                       min_distance_from_earth: nil,
                       max_distance_from_earth: nil)
        
        Earth.atmosphere(surface_pressure: 1.014,
                         average_temperature: 288,
                         total_mass: 5100000.petagram())
        
        Earth.misc(discovered: nil)
        
        Earth.display(texture: "earthmap.jpg",
                      model: nil,
                      normalmap: "earthnormalmap.jpg",
                      ringmap: nil,
                      ring_transparencymap: nil,
                      ring_inner_ratio: nil,
                      ring_outer_ratio: nil)
        
        Earth.images(images: [
            ("earth - reef.jpg", "Earth is the only planet in the universe known to harbor life."),
            ("earth - palau.jpg", "Around 71% of Earth's surface is covered by water.  It is one of several bodies in the solar system with water, but Earth is the only body with permenant liquid surface water."),
            ("earth - lights.jpg", "Seen here are the northern lights, which appear when charged particles from the sun strike the armosphere."),
            ("earth - lava.jpg", "Earth, along with the moons Io, Triton, and Enceladus, are the only geolocically active bodies in the solar system.  Earth's atmosphere is protected by a magnetosphere."),
            ("earth - glacier.jpg", "Glaciers and ice caps account for around 2% of all water on Earth (or around 70% of all fresh water).  Ice caps reflect sunlight back into space."),
            ("earth - falls.jpg", "Less than three percent of all the water on Earth is fresh water.  Fortunately, water that evaporates from the seas leaves behind its salt."),
            ("earth - canyon.jpg", "The dynamic weather conditions shape Earth moreso than other planets.  Seen here is the Grand Canyon, formed by erosion over millions of years."),
            ("earth - crater.jpg", "Although many small meteorites burn up in the atmosphere, occasionally a meteor will impact the ground.  The Meteor Crater in Arizona is a 560 feet deep and formed 50,000 years ago.")])
        
        Earth.colors(background: "earthsurface.jpg",
                     color1: "15334C",
                     color2: "C4C4BB")
        
        //tofix
        let moon = Moon(name: "Moon",
                        position: 1)
        
        moon.about(description: "The Moon is Earth's only permanent natural satellite. It is the fifth-largest natural satellite in the Solar System, and the largest among planetary satellites relative to the size of the planet that it orbits (its primary). It is the second-densest satellite among those whose densities are known (after Jupiter's satellite Io).\n\nThe average distance of the Moon from the Earth is 384,400 km (238,900 mi), or 1.28 light-seconds.\n\nThe Moon is thought to have formed about 4.5 billion years ago, not long after Earth. There are several hypotheses for its origin; the most widely accepted explanation is that the Moon formed from the debris left over after a giant impact between Earth and a Mars-sized body called Theia.\n\nThe Moon is in synchronous rotation with Earth, always showing the same face, with its near side marked by dark volcanic maria that fill the spaces between the bright ancient crustal highlands and the prominent impact craters. It is the second-brightest regularly visible celestial object in Earth's sky, after the Sun, as measured by illuminance on Earth's surface. Its surface is actually dark, although compared to the night sky it appears very bright, with a reflectance just slightly higher than that of worn asphalt. Its prominence in the sky and its regular cycle of phases have made the Moon an important cultural influence since ancient times on language, calendars, art, mythology, and, it is often speculated, the menstrual cycles of the female of the human species.\n\nThe Moon's gravitational influence produces the ocean tides, body tides, and the slight lengthening of the day. The Moon's current orbital distance is about thirty times the diameter of Earth, with its apparent size in the sky almost the same as that of the Sun, resulting in the Moon covering the Sun nearly precisely in total solar eclipse. This matching of apparent visual size will not continue in the far future. The Moon's linear distance from Earth is currently increasing at a rate of 3.82 ± 0.07 centimetres (1.504 ± 0.028 in) per year, but this rate is not constant.",
                   wiki: "https://en.wikipedia.org/wiki/Moon",
                   nasa: "http://solarsystem.nasa.gov/planets/moon")
        
        //        moon.geology(mass: 0.07346,
        //                     volume: 2.1968,
        //                     equatorial: 1738.1,
        //                     density: 33.44,
        //                     gravity: 1.62,
        //                     escape_velocity: 2.38,
        //                     irradiance: 1361.0,
        //                     geographic_height_variance: 13)
        //
        //        moon.orbitals(orbital_length: 29.53,
        //                      perigee: 0.3633,
        //                      apogee: 0.4055,
        //                      velocity: 1.022,
        //                      inclination: 5.145,
        //                      eccentricity: 0.0549,
        //                      day_length: 27.3217,
        //                      equator_inclination: 6.68)
        
        //moon.misc(discovered: nil)
        
        moon.display(texture: "moonmap.jpg",
                     model: nil,
                     normalmap: "moonnormalmap.jpg")
        
        moon.images(images: [
            ("moon - phases.jpg", "The Moon enters different phases based on what direction we observe it from.  These phases form the lunar cycle, which lasts about 29.5 days."),
            ("moon - rover.jpg","The Apollo 17 Lunar Rover being inspected by Astronaut Eugene A. Cernan."),
            ("moon - flag.jpg","The Apollo 14 mission plants its flag on the moon."),
            ("moon - earthrise.jpg","Earthrise from Lunar orbit."),
            ("moon - eclipse.jpg", "Occasionally, the Moon will pass in front of the Sun from the Earth's perspective, causing a solar eclipse over parts of the world.")])
        
        Earth.moons.append(moon)
        
        
        //----------------------------------------------------------------------------------------------
        let Mars = Planet(name: "Mars", type: Type.Rock, position: 4, classification: Class.Major)
        
        Mars.about(description: "Mars is the fourth planet from the Sun and the second-smallest planet in the Solar System, after Mercury. Named after the Roman god of war, it is often referred to as the \"Red Planet\" because the iron oxide prevalent on its surface gives it a reddish appearance. Mars is a terrestrial planet with a thin atmosphere, having surface features reminiscent both of the impact craters of the Moon and the valleys, deserts, and polar ice caps of Earth.\n\nThe rotational period and seasonal cycles of Mars are likewise similar to those of Earth, as is the tilt that produces the seasons. Mars is the site of Olympus Mons, the largest volcano and second-highest known mountain in the Solar System, and of Valles Marineris, one of the largest canyons in the Solar System. The smooth Borealis basin in the northern hemisphere covers 40% of the planet and may be a giant impact feature. Mars has two moons, Phobos and Deimos, which are small and irregularly shaped. These may be captured asteroids, similar to 5261 Eureka, a Mars trojan.\n\nThere are ongoing investigations assessing the past habitability potential of Mars, as well as the possibility of extant life. Future astrobiology missions are planned, including the Mars 2020 and ExoMars rovers. Liquid water cannot exist on the surface of Mars due to low atmospheric pressure, which is about  6⁄1000 that of the Earth's, except at the lowest elevations for short periods. The two polar ice caps appear to be made largely of water. The volume of water ice in the south polar ice cap, if melted, would be sufficient to cover the entire planetary surface to a depth of 11 meters (36 ft). On November 22, 2016, NASA reported finding a large amount of underground ice in the Utopia Planitia region of Mars. The volume of water detected has been estimated to be equivalent to the volume of water in Lake Superior.\n\nMars can easily be seen from Earth with the naked eye, as can its reddish coloring. Its apparent magnitude reaches −2.91, which is surpassed only by Jupiter, Venus, the Moon, and the Sun. Optical ground-based telescopes are typically limited to resolving features about 300 kilometers (190 mi) across when Earth and Mars are closest because of Earth's atmosphere.",
                   wiki: "https://en.m.wikipedia.org/wiki/Mars",
                   nasa: "http://solarsystem.nasa.gov/planets/mars")
        
        Mars.geology(mass: 641710000.exogram(),
                     volume: 163180000.megameter(),
                     equatorial: 3396.2.kilometer(),
                     density: 3933.kilogram(),
                     gravity: 3.71.meter(),
                     escape_velocity: 5.03.kilometer(),
                     irradiance: 586.2,
                     geographic_height_variance: 30.kilometer())
        
        Mars.orbitals(year_length: 686.973.day(),
                      perihelion: 206620000.kilometer(),
                      aphelion: 249230000.kilometer(),
                      velocity: 24.07.kilometer(),
                      inclination: 1.850,
                      eccentricity: 0.0935,
                      day_length: 24.6597.hour(),
                      equator_inclination: 25.19,
                      min_distance_from_earth: 55700000.kilometer(),
                      max_distance_from_earth: 401300000.kilometer())
        
        Mars.atmosphere(surface_pressure: 0.00636,
                        average_temperature: 210,
                        total_mass: 25000000.petagram())
        
        Mars.misc(discovered: "Ancient times")
        
        Mars.display(texture: "marsmap.jpg",
                     model: nil,
                     normalmap: "marsnormalmap.jpg",
                     ringmap: nil,
                     ring_transparencymap: nil,
                     ring_inner_ratio: nil,
                     ring_outer_ratio: nil)
        
        Mars.images(images: [
            ("mars - olympus mons.jpg", "Measuring two and a half times the height of Everest and almost the size of France, Olympus Mons is the largest volcano in the solar system."),
            ("mars - landscape.jpg","Images of the surface taken by the Pathfinder lander.  Pathfinder also delivered a small rover to the surface, named Sojourner."),
            ("mars - pole.jpg", "The north pole of mars, with a large ice cap visible, composed mostly of CO2"),
            ("mars - frosted dunes.jpg", "Sand dunes form on Mars and form patterns when they warm enough to thaw the CO2 permafrost underneath."),
            ("mars - valles marineris.png", "The Valles Marines canyon measures almost four times the length and depth of the Grand Canyon, making it the largest valley in the solar system."),
            ("mars - curiosity selfie.jpg", "Curiosity is the most recent rover to land on Mars; it has been in service since 2012.")])
        
        Mars.colors(background: "marssurface.jpg",
                    color1: "5B4436",
                    color2: "B59087")
        
        let Phobos = Moon(name: "Phobos",
                          position: 1)
        
        Phobos.about(description: "Phobos (systematic designation: Mars I) is the innermost and larger of the two natural satellites of Mars, the other being Deimos. Both moons were discovered in 1877 by American astronomer Asaph Hall.\n\nPhobos is a small, irregularly shaped object with a mean radius of 11 km (7 mi), and is seven times larger than the outer moon, Deimos. Phobos is named after the Greek god, Phobos, a son of Ares (Mars) and Aphrodite (Venus) is the personification of Horror. The name \"Phobos\" is pronounced /ˈfoʊbəs/ foh-bəs or /ˈfoʊbɒs/ foh-bos, or like the Greek Φόβος.\n\nPhobos orbits 6,000 km (3,700 mi) from the Martian surface, closer to its primary body than any other known planetary moon. It is indeed so close that it orbits Mars much faster than Mars rotates, and completes an orbit in just 7 hours and 39 minutes. As a result, from the surface of Mars it appears to rise in the west, move across the sky in 4 hours and 15 minutes or less, and set in the east, twice each Martian day.\n\nPhobos is one of the least reflective bodies in the Solar System, with an albedo of just 0.071. Surface temperatures range from about −4 °C (25 °F) on the sunlit side to −112 °C (−170 °F) on the shadowed side. The defining surface feature is the large impact crater, Stickney, which takes up a substantial proportion of the moon's surface.\n\nImages and models indicate that Phobos may be a rubble pile held together by a thin crust, and that it is being torn apart by tidal interactions. Phobos gets closer to Mars by about 2 meters every one hundred years, and it is predicted that within 30 to 50 million years it will either collide with the planet, or break up into a planetary ring.",
                     wiki: "https://en.wikipedia.org/wiki/Phobos_(moon)",
                     nasa: "http://solarsystem.nasa.gov/planets/phobos")
        
        //        Phobos.geology(mass: 0.0000000010659,
        //                       volume: 0.00000057861,
        //                       equatorial: 11.2667,
        //                       density: 1876,
        //                       gravity: 0.0057,
        //                       escape_velocity: 0.001139,
        //                       irradiance: 586.2,
        //                       geographic_height_variance: nil)
        //
        //        Phobos.orbitals(orbital_length: 0.31891023,
        //                        perigee: 0.00923442,
        //                        apogee: 0.00951758,
        //                        velocity: 2.138,
        //                        inclination: 1.093,
        //                        eccentricity: 0.0151,
        //                        day_length: 24.624,
        //                        equator_inclination: 0.046)
        
        //        Phobos.misc(discovered: "August 18th, 1877")
        
//        Phobos.display(texture: nil,
//                       model: "phobos.dae",
//                       normalmap: nil)
        
        Phobos.images(images: [
            ("phobos - monolith.jpg", "An apparent monolith on Phobos.  Although around 90 meters tall, it is likely just a boulder that fell from a nearby cliff."),
            ("phobos - color.jpg", "Similar to the planet it orbits, Phobos has a red hue."),
            //("phobos - moon transit.gif", "Phobos passing in front of Mars' other moon, Demios in real time, as seen by the Curiosity rover."),
            ("phobos - transit.jpg", "Phobos is not large enough to create a total eclipse when viewed from Mars.  At most, it creates a partial eclipse as photographed here by the Curiosity rover."),
            ("phobos - stickeny.jpg", "Stickeny crater was formed long ago by a massive impact with the surface. Limtoc crater is the smaller crater inside Stickeny.")])
        
        Mars.moons.append(Phobos)
        
        let Deimos = Moon(name: "Deimos",
                          position: 2)
        
        Deimos.about(description: "Deimos (systematic designation: Mars II) is the smaller and outer of the two natural satellites of the planet Mars, the other being Phobos. Deimos has a mean radius of 6.2 km (3.9 mi) and takes 30.3 hours to orbit Mars. The name Deimos is pronounced /ˈdaɪmɒs/ dy-mos, or sometimes /ˈdiːməs/ dee-məs or like the Greek Δεῖμος. In Greek mythology, Deimos was the twin brother of Phobos and personified terror.\n\nDeimos is 23,460 km (14,580 mi) from Mars, much further than Mars's other moon, Phobos.\n\nDeimos was discovered by Asaph Hall, Sr. at the United States Naval Observatory in Washington, D.C on 12 August 1877, at about 07:48 UTC (given in contemporary sources as \"11 August 14:40\" Washington mean time, using an astronomical convention of beginning a day at noon, so 12 hours must be added to get the actual local mean time). Hall also discovered Phobos on 18 August 1877, at about 09:14 GMT, after deliberately searching for Martian moons.", wiki: "https://en.wikipedia.org/wiki/Deimos_(moon)", nasa: "http://solarsystem.nasa.gov/planets/deimos")
        
        //        Deimos.geology(mass: 0.00000000014762,
        //                       volume: 999.78,
        //                       equatorial: 6.2,
        //                       density: 1471,
        //                       gravity: 0.003,
        //                       escape_velocity: 0.0005556,
        //                       irradiance: 586.2,
        //                       geographic_height_variance: nil)
        //
        //        Deimos.orbitals(orbital_length: 1.263,
        //                        perigee: 0.0234555,
        //                        apogee: 0.0234709,
        //                        velocity: 1.3513,
        //                        inclination: 0.93,
        //                        eccentricity: 0.00033,
        //                        day_length: 24.624,
        //                        equator_inclination: 1.791)
        
        //        Deimos.misc(discovered: "August 12th, 1877")
        
        Deimos.images(images: [
            ("deimos - surface.png", "Deimos's surface in detail from 30 km away, taken by the Viking 2 orbiter in a flyby."),
            ("deimos - color.jpg", "The surface of Deimos is relatively smooth because when asteroids impact it, the ejected material escapes its orbit and thus doesn't impact the surface again.")])
        
//        Deimos.display(texture: nil,
//                       model: "deimos.dae",
//                       normalmap: nil)
        
        Mars.moons.append(Deimos)
        
        
        //----------------------------------------------------------------------------------------------
        let Jupiter = Planet(name: "Jupiter",
                             type: Type.Gas,
                             position: 5,
                             classification: Class.Major)
        
        Jupiter.about(description: "Jupiter is the fifth planet from the Sun and the largest in the Solar System. It is a giant planet with a mass one-thousandth that of the Sun, but two and a half times that of all the other planets in the Solar System combined. Jupiter is a gas giant, along with Saturn, with the other two giant planets, Uranus and Neptune, being ice giants. Jupiter was known to astronomers of ancient times. The Romans named it after their god Jupiter. When viewed from Earth, Jupiter can reach an apparent magnitude of −2.94, bright enough for its reflected light to cast shadows, and making it on average the third-brightest object in the night sky after the Moon and Venus.\n\nJupiter is primarily composed of hydrogen with a quarter of its mass being helium, though helium comprises only about a tenth of the number of molecules. It may also have a rocky core of heavier elements, but like the other giant planets, Jupiter lacks a well-defined solid surface. Because of its rapid rotation, the planet's shape is that of an oblate spheroid (it has a slight but noticeable bulge around the equator). The outer atmosphere is visibly segregated into several bands at different latitudes, resulting in turbulence and storms along their interacting boundaries. A prominent result is the Great Red Spot, a giant storm that is known to have existed since at least the 17th century when it was first seen by telescope. Surrounding Jupiter is a faint planetary ring system and a powerful magnetosphere. Jupiter has at least 67 moons, including the four large Galilean moons discovered by Galileo Galilei in 1610. Ganymede, the largest of these, has a diameter greater than that of the planet Mercury.\n\nJupiter has been explored on several occasions by robotic spacecraft, most notably during the early Pioneer and Voyager flyby missions and later by the Galileo orbiter. In late February 2007, Jupiter was visited by the New Horizons probe, which used Jupiter's gravity to increase its speed and bend its trajectory en route to Pluto. The latest probe to visit the planet is Juno, which entered into orbit around Jupiter on July 4, 2016. Future targets for exploration in the Jupiter system include the probable ice-covered liquid ocean of its moon Europa.",
                      wiki: "https://en.wikipedia.org/wiki/Jupiter",
                      nasa: "http://solarsystem.nasa.gov/planets/jupiter")
        
        Jupiter.geology(mass: 1898190000.zettagram(),
                        volume: 1431280.gigameter(),
                        equatorial: 71492.kilometer(),
                        density: 1326.kilogram(),
                        gravity: 24.79.meter(),
                        escape_velocity: 59.5.kilometer(),
                        irradiance: 50.26,
                        geographic_height_variance: nil)
        
        Jupiter.orbitals(year_length: 4330.595.day(),
                         perihelion: 740520000.kilometer(),
                         aphelion: 816620000.kilometer(),
                         velocity: 13.06.kilometer(),
                         inclination: 1.304,
                         eccentricity: 0.0489,
                         day_length: 9.9259.hour(),
                         equator_inclination: 3.13,
                         min_distance_from_earth: 588500000.kilometer(),
                         max_distance_from_earth: 968100000.kilometer())
        
        Jupiter.atmosphere(surface_pressure: 1000,
                           average_temperature: 165,
                           total_mass: nil)
        
        Jupiter.misc(discovered: "Ancient Times")
        
        Jupiter.images(images: [
            ("jupiter - pole.jpg", "The southern pole of Jupiter, including the Great Red Spot.  Imaged by the Cassini orbiter."),
            ("jupiter - io.jpg", "Jupiter has dozens of moons.  Here Io, a large, volcanically active moon, passes in front of Jupiter."),
            ("jupiter - rings.jpg", "Jupiter has a small, barely visible ring system.  Here it's illuminated by the sun on the far side of Jupiter."),
            ("jupiter - arora.jpg", "In 2016, the Hubble space telescope captured ultraviolet spectrum images of massive auroras on Jupiter's north pole."),
            ("jupiter - impact.jpg", "Fragments of a comet impacted Jupiter in 2011."),
            ("jupiter - spot.jpg", "The Great Red Spot on Jupiter is a massive anticyclone large enough to encircle two earth-sized planets.")])
        
        Jupiter.display(texture: "jupitermap.jpg",
                        model: nil,
                        normalmap: nil,
                        ringmap: nil/*"jupiterrings.png"*/,
            ring_transparencymap: nil,
            ring_inner_ratio: 1.72,
            ring_outer_ratio: 3.92)
        
        Jupiter.colors(background: "jupitersurface.jpg",
                       color1: "623D16",
                       color2: "bf9366")
        
        let Metis = Moon(name: "Metis",
                         position: 1)
        
        Metis.about(description: "Metis, also known as Jupiter XVI, is the innermost moon of Jupiter. It was discovered in 1979 in images taken by Voyager 1, and was named in 1983 after the first wife of Zeus, Metis. Additional observations made between early 1996 and September 2003 by the Galileo spacecraft allowed its surface to be imaged.\n\nMetis is tidally locked to Jupiter, and its shape is strongly asymmetrical, with one of the diameters being almost twice as large as the smallest one. It is also one of the two moons known to orbit Jupiter in less than the length of Jupiter's day, the other being Adrastea. It orbits within the main ring of Jupiter, and is thought to be a major contributor of material to the rings.",
                    wiki: "https://en.wikipedia.org/wiki/Metis_(moon)",
                    nasa: "http://solarsystem.nasa.gov/planets/metis")
        
        //        Metis.geology(mass: 3.6,
        //                      volume: 42.7,
        //                      equatorial: 21.5,
        //                      density: 3,
        //                      gravity: 0.017,
        //                      escape_velocity: 98,
        //                      irradiance: 50.26,
        //                      geographic_height_variance: nil)
        //
        //        Metis.orbitals(orbital_length: 0.2947916666,
        //                       perigee: 127974,
        //                       apogee: 128026,
        //                       velocity: 31.501,
        //                       inclination: 0.06,
        //                       eccentricity: 0.0002,
        //                       day_length: 0.294791666,
        //                       equator_inclination: 0)
        
        //        Metis.misc(discovered: "1979")
        
        Jupiter.moons.append(Metis)
        
        let Adrastea = Moon(name: "Adrastea",
                            position: 2)
        
        Adrastea.about(description: "Adrastea, also known as Jupiter XV, is the second by distance, and the smallest of the four inner moons of Jupiter. It was discovered in photographs taken by Voyager 2 in 1979, making it the first natural satellite to be discovered from images taken by an interplanetary spacecraft, rather than through a telescope. It was officially named after the mythological Adrasteia, foster mother of the Greek god Zeus—the equivalent of the Roman god Jupiter.\n\nAdrastea is one of the few moons in the Solar System known to orbit its planet in less than the length of that planet's day. It orbits at the edge of Jupiter's Main Ring and is thought to be the main contributor of material to the Rings of Jupiter. Despite observations made in the 1990s by the Galileo spacecraft, very little is known about the moon's physical characteristics other than its size and the fact that it is tidally locked to Jupiter.",
                       wiki: "https://en.wikipedia.org/wiki/Adrastea_(moon)",
                       nasa: "http://solarsystem.nasa.gov/planets/adrastea")
        
        //        Adrastea.geology(mass: 0.74933,
        //                         volume: 2310,
        //                         equatorial: 8.2,
        //                         density: 3,
        //                         gravity: 0.007,
        //                         escape_velocity: 11,
        //                         irradiance: 50.26,
        //                         geographic_height_variance: nil)
        //
        //        Adrastea.orbitals(orbital_length: 0.29826,
        //                          perigee: 129000,
        //                          apogee: 129000,
        //                          velocity: 31.378,
        //                          inclination: 0.03,
        //                          eccentricity: 0.0015,
        //                          day_length: 0.29826,
        //                          equator_inclination: 0)
        
        //        Adrastea.misc(discovered: "1979")
        
        Jupiter.moons.append(Adrastea)
        
        let Amalthea = Moon(name: "Amalthea",
                            position: 3)
        
        Amalthea.about(description: "Amalthea is the third moon of Jupiter in order of distance from the planet. It was discovered on 9 September 1892, by Edward Emerson Barnard and named after Amalthea, a nymph in Greek mythology. It is also known as Jupiter V.\n\nAmalthea is in a close orbit around Jupiter and is within the outer edge of the Amalthea Gossamer Ring, which is formed from dust ejected from its surface. From its surface, Jupiter would appear 46.5 degrees in diameter. Amalthea is the largest of the inner satellites of Jupiter. Irregularly shaped and reddish in color, it is thought to consist of porous water ice with unknown amounts of other materials. Its surface features include large craters and ridges.\n\nAmalthea was photographed in 1979 by the Voyager and 2 spacecraft, and later, in more detail, by the Galileo orbiter in the 1990s.",
                       wiki: "https://en.wikipedia.org/wiki/Amalthea_(moon)",
                       nasa: "http://solarsystem.nasa.gov/planets/amalthea")
        
        //        Amalthea.geology(mass: 208,
        //                         volume: 2.43,
        //                         equatorial: 83.5,
        //                         density: 0.857,
        //                         gravity: 0.02,
        //                         escape_velocity: 58,
        //                         irradiance: 50.26,
        //                         geographic_height_variance: nil)
        //
        //        Amalthea.orbitals(orbital_length: 0.49817943,
        //                          perigee: 181150,
        //                          apogee: 182840,
        //                          velocity: 26.57,
        //                          inclination: 0.374,
        //                          eccentricity: 0.00319,
        //                          day_length: 0.49817943,
        //                          equator_inclination: 0)
        
        //        Amalthea.misc(discovered: "1892")
        
        Amalthea.display(texture: nil,
                         model: "amalthea.dae",
                         normalmap: nil)
        
        Jupiter.moons.append(Amalthea)
        
        let Thebe = Moon(name: "Thebe", position: 4)
        
        Thebe.about(description: "Thebe also known as Jupiter XIV, is the fourth of Jupiter's moons by distance from the planet. It was discovered by Stephen P. Synnott in images from the Voyager 1 space probe taken on March 5, 1979, while making its flyby of Jupiter. In 1983 it was officially named after the mythological nymph Thebe.\n\nThe second largest of the inner satellites of Jupiter, Thebe orbits within the outer edge of the Thebe gossamer ring that is formed from dust ejected from its surface. It is irregularly shaped and reddish in colour, and is thought like Amalthea to consist of porous water ice with unknown amounts of other materials. Its surface features include large craters and high mountains—some of them are comparable to the size of the moon itself.\n\nThebe was photographed in 1979 by the Voyager 1 and 2 spacecraft, and later, in more detail, by the Galileo orbiter in the 1990s.",
                    wiki: "https://en.wikipedia.org/wiki/Thebe_(moon)",
                    nasa: "http://solarsystem.nasa.gov/planets/thebe")
        
        //        Thebe.geology(mass: 0.014987,
        //                      volume: 501914,
        //                      equatorial: 49.3,
        //                      density: 3,
        //                      gravity: 0.013,
        //                      escape_velocity: 64,
        //                      irradiance: 50.26,
        //                      geographic_height_variance: nil)
        //
        //        Thebe.orbitals(orbital_length: 0.674536,
        //                       perigee: 218000,
        //                       apogee: 226000,
        //                       velocity: 23.92,
        //                       inclination: 1.076,
        //                       eccentricity: 0.0175,
        //                       day_length: 0.674536,
        //                       equator_inclination: 0)
        
        //        Thebe.misc(discovered: "1979")
        
        Jupiter.moons.append(Thebe);
        
        let Io = Moon(name: "Io",
                      position: 5)
        
        Io.about(description: "Io is the innermost of the four Galilean moons of the planet Jupiter. It is the fourth-largest moon, has the highest density of all the moons, and has the least amount of relative water of any known object in the Solar System. It was discovered in 1610 and was named after the mythological character Io, a priestess of Hera who became one of Zeus's lovers.\n\nWith over 400 active volcanoes, Io is the most geologically active object in the Solar System. This extreme geologic activity is the result of tidal heating from friction generated within Io's interior as it is pulled between Jupiter and the other Galilean satellites—Europa, Ganymede and Callisto. Several volcanoes produce plumes of sulfur and sulfur dioxide that climb as high as 500 km (300 mi) above the surface. Io's surface is also dotted with more than 100 mountains that have been uplifted by extensive compression at the base of Io's silicate crust. Some of these peaks are taller than Mount Everest. Unlike most satellites in the outer Solar System, which are mostly composed of water ice, Io is primarily composed of silicate rock surrounding a molten iron or iron-sulfide core. Most of Io's surface is composed of extensive plains coated with sulfur and sulfur-dioxide frost.\n\nIo's volcanism is responsible for many of its unique features. Its volcanic plumes and lava flows produce large surface changes and paint the surface in various subtle shades of yellow, red, white, black, and green, largely due to allotropes and compounds of sulfur. Numerous extensive lava flows, several more than 500 km (300 mi) in length, also mark the surface. The materials produced by this volcanism make up Io's thin, patchy atmosphere and Jupiter's extensive magnetosphere. Io's volcanic ejecta also produce a large plasma torus around Jupiter.\n\nIo played a significant role in the development of astronomy in the 17th and 18th centuries. It was discovered in January 1610 by Galileo Galilei, along with the other Galilean satellites. This discovery furthered the adoption of the Copernican model of the Solar System, the development of Kepler's laws of motion, and the first measurement of the speed of light. From Earth, Io remained just a point of light until the late 19th and early 20th centuries, when it became possible to resolve its large-scale surface features, such as the dark red polar and bright equatorial regions. In 1979, the two Voyager spacecraft revealed Io to be a geologically active world, with numerous volcanic features, large mountains, and a young surface with no obvious impact craters. The Galileo spacecraft performed several close flybys in the 1990s and early 2000s, obtaining data about Io's interior structure and surface composition. These spacecraft also revealed the relationship between Io and Jupiter's magnetosphere and the existence of a belt of high-energy radiation centered on Io's orbit. Io receives about 3,600 rem (36 Sv) of ionizing radiation per day.\n\nFurther observations have been made by Cassini–Huygens in 2000 and New Horizons in 2007, as well as from Earth-based telescopes and the Hubble Space Telescope.\n\nFrom the surface of Io, Jupiter would subtend an arc of 19.5°, making Jupiter to appear 39 times the apparent diameter of our Moon.",
                 wiki: "https://en.wikipedia.org/wiki/Io_(moon)",
                 nasa: "http://solarsystem.nasa.gov/planets/io")
        
        Io.images(images: [
            ("io - pele.jpg", "An eruption of Io's volcano Pele.  The fallout covers an area the size of Alaska."),
            ("io - tohil.jpg", "Although not a volcano, Tohil Mons towers over 18,000 feet above Io's surface.  Questions remain over whether its origin is volcanic or not."),
            ("io - tupan.jpg", "Tupan Patera is a volcanic depression around 47 miles across and surrounded by cliffs 3000 feet high.  Lava flows throughout the center of the crater."),
            ("io - jupiter.jpg", "Io Passing in front of Jupiter.  Io is slightly larger than Earth's moon."),
            ("io - tvashtar.jpg", "Tvashtar Catena is a chain of volcanic caulderas caught in the middle of an eruption during the Galeleo orbiter's flyby of Io in November 1999."),
            ("io - volcano.jpg", "The Voyager 1 flyby of Io revealed an incredible sight: a volcanic plume expulsing matter over 100 miles above the moon's surface.")])
        
        Io.display(texture: "iomap.jpg",
                   model: nil,
                   normalmap: nil)
        
        Jupiter.moons.append(Io)
        
        let Europa = Moon(name: "Europa",
                          position: 6)
        
        Europa.about(description: "Europa (Jupiter II), is the smallest of the four Galilean moons orbiting Jupiter, and the sixth-closest to the planet. It is also the sixth-largest moon in the Solar System. Europa was discovered in 1610 by Galileo Galilei and was named after Europa, the legendary mother of King Minos of Crete and lover of Zeus (the Greek equivalent of the Roman god Jupiter).\n\nSlightly smaller than Earth's Moon, Europa is primarily made of silicate rock and has a water-ice crust and probably an iron–nickel core. It has a tenuous atmosphere composed primarily of oxygen. Its surface is striated by cracks and streaks, whereas craters are relatively rare. In addition to Earth-bound telescope observations, Europa has been examined by a succession of space probe flybys, the first occurring in the early 1970s.\n\nEuropa has the smoothest surface of any known solid object in the Solar System. The apparent youth and smoothness of the surface have led to the hypothesis that a water ocean exists beneath it, which could conceivably harbor extraterrestrial life. The predominant model suggests that heat from tidal flexing causes the ocean to remain liquid and drives ice movement similar to plate tectonics, absorbing chemicals from the surface into the ocean below. Sea salt from a subsurface ocean may be coating some geological features on Europa, suggesting that the ocean is interacting with the seafloor. This may be important in determining if Europa could be habitable. In addition, the Hubble Space Telescope detected water vapor plumes similar to those observed on Saturn's moon Enceladus, which are thought to be caused by erupting cryogeysers.\n\nThe Galileo mission, launched in 1989, provides the bulk of current data on Europa. No spacecraft has yet landed on Europa, although there have been several proposed exploration missions. The European Space Agency's Jupiter Icy Moon Explorer (JUICE) is a mission to Ganymede that is due to launch in 2022, but it will conduct two flybys of Europa. NASA's planned Europa Multiple-Flyby Mission will be launched in the mid-2020s.",
                     wiki: "https://en.wikipedia.org/wiki/Europa_(moon)",
                     nasa: "http://solarsystem.nasa.gov/planets/europa")
        
        Europa.images(images: [
            ("europa - red.jpg", "On Europa's ice-covered surface, blue and white areas are relatively pure ice, whereas red areas indicate water ice mixed with hydrated salts, potentially magnesium sulfate or sulfuric acid"),
            ("europa - ridge.jpg", "Ridges that form on Europa are likely the result of intense tidal forces or energy coming from the moon's interior."),
            ("europa - linea.jpg", "The Minos Linea region on Europa is a part of the surface carved up by sections where salts are mixed in the ice."),
            ("europa - impact.jpg", "This crater is around the size of Hawaii (140km across) and formed when a massive asteroid impacted the surface of the moon."),
            ("europa - galileo.jpg", "This image, taken by the Galileo orbiter, shows the intricate patterns and details of Europa's ice-covered surface."),
            ("europa - freckles.jpg", "Thse dark, freckled spots on Europa suggest there is movement in the ocean beneath the frozen surface: warm water rises to right beneath the ice until it cools and sinks back down.")])
        
        Europa.display(texture: "europamap.jpg",
                       model: nil,
                       normalmap: nil)
        
        Jupiter.moons.append(Europa)
        
        let Ganymede = Moon(name: "Ganymede",
                            position: 7)
        
        Ganymede.about(description: "Ganymede (Jupiter III) is the largest and most massive moon of Jupiter and in the Solar System. The ninth largest object in the Solar System, it is the largest without a substantial atmosphere. It has a diameter of 5,268 km (3,273 mi) and is 8% larger than the planet Mercury, although only 45% as massive. Possessing a metallic core, it has the lowest moment of inertia factor of any solid body in the Solar System and is the only moon known to have a magnetic field. It is the third of the Galilean moons, the first group of objects discovered orbiting another planet, and the seventh satellite outward from Jupiter, Ganymede orbits Jupiter in roughly seven days and is in a 1:2:4 orbital resonance with the moons Europa and Io, respectively.\n\nGanymede is composed of approximately equal amounts of silicate rock and water ice. It is a fully differentiated body with an iron-rich, liquid core, and an internal ocean that may contain more water than all of Earth's oceans combined. Its surface is composed of two main types of terrain. Dark regions, saturated with impact craters and dated to four billion years ago, cover about a third of the satellite. Lighter regions, crosscut by extensive grooves and ridges and only slightly less ancient, cover the remainder. The cause of the light terrain's disrupted geology is not fully known, but was likely the result of tectonic activity due to tidal heating.\n\nGanymede's magnetic field is probably created by convection within its liquid iron core. The meager magnetic field is buried within Jupiter's much larger magnetic field and would show only as a local perturbation of the field lines. The satellite has a thin oxygen atmosphere that includes O, O2, and possibly O3 (ozone). Atomic hydrogen is a minor atmospheric constituent. Whether the satellite has an ionosphere associated with its atmosphere is unresolved.\n\nGanymede's discovery is credited to Galileo Galilei, who was the first to observe it on January 7, 1610. The satellite's name was soon suggested by astronomer Simon Marius, for the mythological Ganymede, cupbearer of the Greek gods and Zeus's lover. Beginning with Pioneer 10, several spacecraft have explored Ganymede. The Voyager probes refined measurements of its size, while Galileo discovered its underground ocean and magnetic field. The next planned mission to the Jovian system is the European Space Agency's Jupiter Icy Moon Explorer (JUICE), due to launch in 2022. After flybys of all three icy Galilean moons, the probe is planned to enter orbit around Ganymede.",
                       wiki: "https://en.wikipedia.org/wiki/Ganymede_(moon)",
                       nasa: "http://solarsystem.nasa.gov/planets/ganymede")
        
        Ganymede.images(images: [
            ("ganymede - craters.jpg", "Two craters on the surface of Ganymede from recent impacts - Achelous in the center and Gula to the north.  Both are around 35 km across."),
            ("ganymede - jupiter.jpg", "Ganymede begins to dissapear behind Jupiter.  This shot was taken by Hubble."),
            ("ganymede - surface.jpg", "The poles of Ganymede are very large - ice and frost extend up to 25 degrees north of the equator."),
            ("ganymede - terrain.jpg", "Grooved terrain on Ganymede is thought to be formed by plate tectonics caused by tidal resonances.")])
        
        Ganymede.display(texture: "ganymedemap.jpg",
                         model: nil,
                         normalmap: nil)
        
        Jupiter.moons.append(Ganymede)
        
        let Callisto = Moon(name: "Callisto",
                            position: 8)
        
        Callisto.about(description: "Callisto (Jupiter IV) is the second-largest moon of Jupiter, after Ganymede. It is the third-largest moon in the Solar System and the largest object in the Solar System not to be properly differentiated. Callisto was discovered in 1610 by Galileo Galilei. At 4821 km in diameter, Callisto has about 99% the diameter of the planet Mercury but only about a third of its mass. It is the fourth Galilean moon of Jupiter by distance, with an orbital radius of about 1883000 km. It is not in an orbital resonance like the three other Galilean satellites—Io, Europa, and Ganymede—and is thus not appreciably tidally heated. Callisto's rotation is tidally locked to its orbit around Jupiter, so that the same hemisphere always faces inward; Jupiter appears to stand nearly still in Callisto's sky. It is less affected by Jupiter's magnetosphere than the other inner satellites because of its more remote orbit, located just outside Jupiter's main radiation belt.\n\nCallisto is composed of approximately equal amounts of rock and ices, with a density of about 1.83 g/cm3, the lowest density and surface gravity of Jupiter's major moons. Compounds detected spectroscopically on the surface include water ice, carbon dioxide, silicates, and organic compounds. Investigation by the Galileo spacecraft revealed that Callisto may have a small silicate core and possibly a subsurface ocean of liquid water at depths greater than 100 km.\n\nThe surface of Callisto is the oldest and most heavily cratered in the Solar System. Its surface is completely covered with impact craters. It does not show any signatures of subsurface processes such as plate tectonics or volcanism, with no signs that geological activity in general has ever occurred, and is thought to have evolved predominantly under the influence of impacts. Prominent surface features include multi-ring structures, variously shaped impact craters, and chains of craters (catenae) and associated scarps, ridges and deposits. At a small scale, the surface is varied and made up of small, sparkly frost deposits at the tips of high spots, surrounded by a low-lying, smooth blanket of dark material. This is thought to result from the sublimation-driven degradation of small landforms, which is supported by the general deficit of small impact craters and the presence of numerous small knobs, considered to be their remnants. The absolute ages of the landforms are not known.\n\nCallisto is surrounded by an extremely thin atmosphere composed of carbon dioxide and probably molecular oxygen, as well as by a rather intense ionosphere. Callisto is thought to have formed by slow accretion from the disk of the gas and dust that surrounded Jupiter after its formation. Callisto's gradual accretion and the lack of tidal heating meant that not enough heat was available for rapid differentiation. The slow convection in the interior of Callisto, which commenced soon after formation, led to partial differentiation and possibly to the formation of a subsurface ocean at a depth of 100–150 km and a small, rocky core.\n\nThe likely presence of an ocean within Callisto leaves open the possibility that it could harbor life. However, conditions are thought to be less favorable than on nearby Europa. Various space probes from Pioneers 10 and 11 to Galileo and Cassini have studied Callisto. Because of its low radiation levels, Callisto has long been considered the most suitable place for a human base for future exploration of the Jovian system.",
                       wiki: "https://en.wikipedia.org/wiki/Callisto_(moon)",
                       nasa: "http://solarsystem.nasa.gov/planets/callisto")
        
        Callisto.images(images: [
            ("callisto - globe.jpg", "Callisto is not properly differentiated, meaning its contents have not separated into layers based on density."),
            ("callisto - landslides.jpg", "The two large graters in this image from Galileo show landslides, indicating that the surface of Callisto is fine-grained."),
            ("callisto - plains.jpg", "This image swathe, taken by the Galelio orbiter, shows a smoothing of the craters on the moon's surface."),
            ("callisto - valhalla.jpg", "The Valhalla crater is a massive ring impact structure on Callisto's surface.  The impact rings extend over 1,800 kilometers from the center.")])
        
        Callisto.display(texture: "callistomap.jpg",
                         model: nil,
                         normalmap: nil)
        
        Jupiter.moons.append(Callisto)
        
        let Themisto = Moon(name: "Themisto",
                            position: 9)
        
        Themisto.about(description: "Themisto, also known as Jupiter XVIII, is a small prograde irregular satellite of Jupiter. Themisto was first discovered by Charles T. Kowal and Elizabeth Roemer on September 30, 1975, reported on October 3, 1975 and designated S/1975 J 1. However, not enough observations were made to establish an orbit and it was subsequently lost.\n\nThemisto appeared as a footnote in astronomy textbooks into the 1980s. Then, in 2000, a seemingly new satellite was discovered by Scott S. Sheppard, David C. Jewitt, Yanga R. Fernández and Eugene A. Magnier, and was designated S/2000 J 1. It was soon confirmed that this was the same as the one observed in 1975. This observation was immediately correlated with an observation on August 6, 2000, by the team of Brett J. Gladman, John J. Kavelaars, Jean-Marc Petit, Hans Scholl, Matthew J. Holman, Brian G. Marsden, Philip D. Nicholson and Joseph A. Burns, which was reported to the Minor Planet Center but not published as an IAU Circular (IAUC).  In October 2002 it was officially named after Themisto, daughter of the river god Inachus and lover of Zeus (Jupiter) in Greek mythology.\n\nThemisto's orbit is unusual: unlike most of Jupiter's moons, which orbit in distinct groups, Themisto orbits alone. The moon is located midway between the Galilean moons and the first group of prograde irregular moons, called the Himalia group.\n\nThemisto is about 8 kilometers (5 miles) in diameter (assuming an albedo of 0.04). That figure can be used to find a surface area of between 200 and 380 square kilometers.",
                       wiki: "https://en.wikipedia.org/wiki/Themisto_(moon)",
                       nasa: "http://solarsystem.nasa.gov/planets/themisto")
        
        Jupiter.moons.append(Themisto)
        
        let Leda = Moon(name: "Leda",
                        position: 10)
        
        Leda.about(description: "Leda, also known as Jupiter XIII, is a prograde irregular satellite of Jupiter. It was discovered by Charles T. Kowal at the Mount Palomar Observatory on September 14, 1974, after three nights' worth of photographic plates had been taken (September 11 through 13; Leda appears on all of them). It was named after Leda, who was a lover of Zeus, the Greek equivalent of Jupiter (who came to her in the form of a swan). Kowal suggested the name and the IAU endorsed it in 1975.\n\nLeda belongs to the Himalia group, five moons orbiting between 11 and 13 Gm from Jupiter at an inclination of about 27.5°. The orbital elements given here are as of January 2000, but they are continuously changing due to solar and planetary perturbations.",
                   wiki: "https://en.wikipedia.org/wiki/Leda_(moon)",
                   nasa: "http://solarsystem.nasa.gov/planets/leda")
        
        Jupiter.moons.append(Leda)
        
        let Himalia = Moon(name: "Himalia",
                           position: 11)
        
        Himalia.about(description: "Himalia is the largest irregular satellite of Jupiter, the sixth largest overall in size, and only the four Galilean moons of Jupiter have greater mass. It was discovered by Charles Dillon Perrine at the Lick Observatory on 3 December 1904 and is named after the nymph Himalia, who bore three sons of Zeus (the Greek equivalent of Jupiter). It is one of the largest planetary moons in the Solar System not imaged in detail, and the largest not including the moons of Neptune and several trans-Neptunian objects, particularly that of the second-largest-but-most-massive dwarf planet, Eris.\n\nHimalia was discovered by Charles Dillon Perrine at the Lick Observatory on 3 December 1904. Himalia is Jupiter's most easily observed small satellite; though Amalthea is brighter, its proximity to the planet's brilliant disk makes it a far more difficult object to view.\n\nHimalia is named after the nymph Himalia, who bore three sons of Zeus (the Greek equivalent of Jupiter). The moon did not receive its present name until 1975; before then, it was simply known as Jupiter VI or Jupiter Satellite VI, although calls for a full name appeared shortly after its and Elara's discovery; A.C.D. Crommelin wrote in 1905:",
                      wiki: "https://en.wikipedia.org/wiki/Himalia_(moon)",
                      nasa: "http://solarsystem.nasa.gov/planets/himalia")
        
        Jupiter.moons.append(Himalia)
        
        let Lysithea = Moon(name: "Lysithea",
                            position: 12)
        
        Lysithea.about(description: "Lysithea is a prograde irregular satellite of Jupiter. It was discovered by Seth Barnes Nicholson in 1938 at Mount Wilson Observatory and is named after the mythological Lysithea, daughter of Oceanus and one of Zeus' lovers.\n\nLysithea did not receive its present name until 1975; before then, it was simply known as Jupiter X. It was sometimes called \"Demeter\" from 1955 to 1975.\n\nIt belongs to the Himalia group, five moons orbiting between 11 and 13 Gm from Jupiter at an inclination of about 28.3°. Its orbital elements are as of January 2000. They are continuously changing due to solar and planetary perturbations.",
                       wiki: "https://en.wikipedia.org/wiki/Lysithea_(moon)",
                       nasa: "http://solarsystem.nasa.gov/planets/lysithea")
        
        Jupiter.moons.append(Lysithea)
        
        let Elara = Moon(name: "Elara",
                         position: 13)
        
        Elara.about(description: "Elara is a prograde irregular satellite of Jupiter. It was discovered by Charles Dillon Perrine at Lick Observatory in 1905. It is the eighth largest moon of Jupiter and is named after Elara, one of Zeus's lovers and the mother of the giant Tityos.\n\nElara did not receive its present name until 1975; before then, it was simply known as Jupiter VII. It was sometimes called \"Hera\" between 1955 and 1975. It has a mean radius of just 43 km, thus it is 2% of the size of Europa. However it is half the size of Himalia, so it is the second biggest moon in the Himalia group. It might be a captured type C or D asteroid, for it reflects very little light.\n\nElara belongs to the Himalia group, five moons orbiting between 11 and 13 Gm from Jupiter at an inclination of about 27.5°. Its orbital elements are as of January 2000. They are continuously changing due to solar and planetary perturbations.",
                    wiki: "https://en.wikipedia.org/wiki/Elara_(moon)",
                    nasa: "http://solarsystem.nasa.gov/planets/elara")
        
        Jupiter.moons.append(Elara);
        
        let Dia = Moon(name: "Dia",
                       position: 14)
        
        Dia.about(description: "Dia, also known as Jupiter LIII, is the second-outermost known prograde irregular satellite of Jupiter. Provisionally known as S/2000 J 11, it received its name on March 7, 2015. It is named after Dia, daughter of Deioneus (or Eioneus), wife of Ixion. According to Homer, she was seduced by Zeus in stallion form; Pirithous was the issue.\n\nThe satellite is the only known small body in the Himalia group.\n\nDia is believed to be about 4 kilometres in diameter. It orbits Jupiter at an average distance of 12 million km in 274 days, at an inclination of 28° (to Jupiter's equator), and with an eccentricity of 0.21.Dia was discovered by a team of astronomers from the University of Hawaii led by Scott S. Sheppard in 2000 with an observation arc of 26 days.\n\nInitial observations were not followed up, and Dia was not observed for more than a decade after 2000. This apparent disappearance led some astronomers to consider the moon lost. One theory was that it had crashed into Himalia, creating a faint ring around Jupiter. However, it was finally recovered in observations made in 2010 and 2011.",
                  wiki: "https://en.wikipedia.org/wiki/Dia_(moon)",
                  nasa: "http://solarsystem.nasa.gov/planets/dia")
        
        Jupiter.moons.append(Dia)
        
        let Carpo = Moon(name: "Carpo",
                         position: 15)
        
        Carpo.about(description: "Carpo , also Jupiter XLVI, is a natural satellite of Jupiter. It was discovered by a team of astronomers from the University of Hawaii led by Scott S. Sheppard in 2003, and was provisionally designated as S/2003 J 20 until it received its name in early 2005.\n\nCarpo is about 3 kilometres (1.9 miles) in diameter, and orbits Jupiter at an average distance of 17.145 Gm (just over ten million miles) in 458.625 days, at an inclination of 56° to the ecliptic (55° to Jupiter's equator), and with a high eccentricity of 0.4316. All of the moons further from Jupiter than Carpo are retrograde.\n\nIt was named in March 2005 after Carpo, one of the Horae, and a daughter of Zeus (Jupiter).\n\nLike Themisto, this moon seems to be the lone member of a unique class, which makes it particularly interesting. The orbital inclination of satellites such as this one is limited by the Kozai effect, discovered by Yoshihide Kozai in 1962. This effect induces a periodic exchange between the inclination and eccentricity of the orbit; if the inclination is large enough, the eccentricity can in turn grow so large that the periapsis of the satellite (called the perizene in the case of moons of Jupiter) would be in the immediate vicinity of the Galilean moons (Io, Europa, Ganymede and Callisto). The satellite would eventually collide with one of these, or a close encounter would eject it altogether from the Jovian system. The periapsis precession period (Pw) is 6.8 million years long.",
                    wiki: "https://en.wikipedia.org/wiki/Carpo_(moon)",
                    nasa: "http://solarsystem.nasa.gov/planets/carpo")
        
        Jupiter.moons.append(Carpo)
        
        let J12 = Moon(name: "S/2003 J 12",
                       position: 16)
        
        J12.about(description: "S/2003 J 12 is a natural satellite of Jupiter, and is the third-smallest known satellite in the Solar System, after Aegaeon and S/2009 S 1. It was discovered by a team of astronomers from the University of Hawaii led by Scott S. Sheppard in 2003.\n\nS/2003 J 12 is about 1 kilometre (0.6 miles) in diameter, and orbits Jupiter at an average distance of 17,883 Mm in 489.72 days, at an inclination of 143° to the ecliptic (143° to Jupiter's equator), in a retrograde direction and with an eccentricity of 0.4920.\n\nIt is the innermost of the outer irregular retrograde satellites of Jupiter, and does not seem to belong to any group.",
                  wiki: "https://en.wikipedia.org/wiki/S/2003_J_12",
                  nasa: "http://solarsystem.nasa.gov/planets/s2003j12")
        
        Jupiter.moons.append(J12)
        
        let Euporie = Moon(name: "Euporie",
                           position: 17)
        
        Euporie.about(description: "Euporie, also known as Jupiter XXXIV, is a natural satellite of Jupiter. It was discovered by a team of astronomers from the University of Hawaii led by Scott S. Sheppard in 2001, and given the temporary designation S/2001 J 10.\n\nEuporie is about 2 kilometres in diameter, and orbits Jupiter at an average distance of 19,088 Mm in 538.780 days, at an inclination of 145° to the ecliptic (145° to Jupiter's equator), in a retrograde direction and with an eccentricity of 0.0960.\n\nIt was named in August 2003 after Euporie, a Greek goddess of abundance and one of the Horae in Greek mythology (and thus a daughter of Zeus).\n\nIt is the innermost member of the Ananke group, retrograde irregular moons that orbit Jupiter between 19.3 and 22.7 Gm, at inclinations of roughly 150°.",
                      wiki: "https://en.wikipedia.org/wiki/Euporie_(moon)",
                      nasa: "http://solarsystem.nasa.gov/planets/euporie")
        
        Jupiter.moons.append(Euporie)
        
        let J3 = Moon(name: "S/2003 J 3",
                      position: 18)
        
        J3.about(description: "S/2003 J 3 is a natural satellite of Jupiter. It was discovered by a team of astronomers from the University of Hawaii led by Scott S. Sheppard in 2003.\n\nS/2003 J 3 is about 2 kilometres in diameter, and orbits Jupiter at an average distance of 19,622 Mm in 561.518 days, at an inclination of 146° to the ecliptic (146° to Jupiter's equator), in a retrograde direction and with an eccentricity of 0.2507.\n\nIt belongs to the Ananke group, retrograde irregular moons that orbit Jupiter between 19.3 and 22.7 Gm, at inclinations of roughly 150°.",
                 wiki: "https://en.wikipedia.org/wiki/S/2003_J_3",
                 nasa: "http://solarsystem.nasa.gov/planets/s2003j03")
        
        Jupiter.moons.append(J3)
        
        let J18 = Moon(name: "S/2003 J 18",
                       position: 19)
        
        J18.about(description: "S/2003 J 18 is a natural satellite of Jupiter. It was discovered by a team of astronomers led by Brett J. Gladman in 2003.\n\nS/2003 J 18 is about 2 kilometres in diameter, and orbits Jupiter at an average distance of 19,813 Mm in 569.728 days, at an inclination of 147° to the ecliptic (149° to Jupiter's equator), in a retrograde direction and with an eccentricity of 0.1570.\n\nIt belongs to the Ananke group, retrograde irregular moons that orbit Jupiter between 19.3 and 22.7 Gm, at inclinations of roughly 150°.",
                  wiki: "https://en.wikipedia.org/wiki/S/2003_J_18",
                  nasa: "http://solarsystem.nasa.gov/planets/s2003j18")
        
        Jupiter.moons.append(J18)
        
        let J1 = Moon(name: "S/2011 J 1",
                      position: 20)
        
        J1.about(description: "S/2011 J 1 is a natural satellite of Jupiter. It was discovered by Scott Sheppard in 2011.",
                 wiki: "https://en.wikipedia.org/wiki/S/2011_J_1",
                 nasa: "http://solarsystem.nasa.gov/planets/s2011j1")
        
        Jupiter.moons.append(J1)
        
        let J2 = Moon(name: "Jupiter LII",
                      position: 21)
        
        J2.about(description: "Jupiter LII, originally known as S/2010 J 2, is a natural satellite of Jupiter. It was discovered by Christian Veillet in 2010. It received its permanent number in March 2015. It takes 1.69 years to orbit around Jupiter, and its average distance is 21.01 million km. Jupiter LII has a diameter of about 1 kilometer and in 2010 it was labeled the smallest known moon in the solar system to have been found from Earth.",
                 wiki: "https://en.wikipedia.org/wiki/Jupiter_LII",
                 nasa: "http://solarsystem.nasa.gov/planets/s2010j2")
        
        Jupiter.moons.append(J2)
        
        let Thelxinoe = Moon(name: "Thelxinoe",
                             position: 22)
        
        Thelxinoe.about(description: "Thelxinoe, also known as Jupiter XLII, is a natural satellite of Jupiter. It was discovered by a team of astronomers from the University of Hawaii led by Scott S. Sheppard in 2004 from pictures taken in 2003, and originally received the temporary designation S/2003 J 22.\n\nThelxinoe is about 2 kilometres in diameter, and orbits Jupiter at an average distance of 20,454 Mm in 597.607 days, at an inclination of 151° to the ecliptic (153° to Jupiter's equator), in a retrograde direction and with an eccentricity of 0.2685.\n\nIt was named in March 2005 after Thelxinoe, one of the four original Muses according to some Greek writers, and a daughter of Zeus (Jupiter) by Mnemosyne.\n\nThelxinoe belongs to the Ananke group, retrograde irregular moons that orbit Jupiter between 19.3 and 22.7 Gm, at inclinations of roughly 150°.",
                        wiki: "https://en.wikipedia.org/wiki/Thelxinoe_(moon)",
                        nasa: "http://solarsystem.nasa.gov/planets/thelxinoe")
        
        Jupiter.moons.append(Thelxinoe)
        
        let Euanthe = Moon(name: "Euanthe",
                           position: 23)
        
        Euanthe.about(description: "Euanthe, also known as Jupiter XXXIII, is a retrograde irregular satellite of Jupiter. It was discovered by a team of astronomers from the University of Hawaii led by Scott S. Sheppard in 2001, and given the temporary designation S/2001 J 7.\n\nEuanthe is about 3 kilometres in diameter, and orbits Jupiter at an average distance of 20,465 Mm in 598.093 days, at an inclination of 143° to the ecliptic (142° to Jupiter's equator) with an eccentricity of 0.2001.\n\nIt was named in August 2003 after Euanthe, who was the mother of the Graces, according to some Greek writers.\n\nEuanthe belongs to the Ananke group, retrograde irregular moons that orbit Jupiter between 19.3 and 22.7 Gm, at inclinations of roughly 150°.",
                      wiki: "https://en.wikipedia.org/wiki/Euanthe_(moon)",
                      nasa: "http://solarsystem.nasa.gov/planets/euanthe")
        
        Jupiter.moons.append(Euanthe)
        
        let Helike = Moon(name: "Helike",
                          position: 24)
        
        Helike.about(description: "Helike, also known as Jupiter XLV, is a moon of Jupiter. It was discovered by a team of astronomers from the University of Hawaii led by Scott S. Sheppard in 2003, and given the temporary designation S/2003 J 6.\n\nHelike is about 4 kilometres in diameter, and orbits Jupiter at an average distance of 20.54 million kilometres in 601.402 days, at an inclination of 155° to the ecliptic (156° to Jupiter's equator), in a retrograde direction and with an eccentricity of 0.1375. Its average orbital speed is 2.48 km/s.\n\nIt was named in March 2005 after Helike, one of the nymphs that nurtured Zeus (Jupiter) in his infancy on Crete.\n\nHelike belongs to the Ananke group, retrograde irregular moons that orbit Jupiter between 19.3 and 22.7 million kilometres, at inclinations of roughly 150°.",
                     wiki: "http://solarsystem.nasa.gov/planets/helike",
                     nasa: "http://solarsystem.nasa.gov/planets/helike")
        
        Jupiter.moons.append(Helike)
        
        let Orthosie = Moon(name: "Orthosie",
                            position: 25)
        
        Orthosie.about(description: "Orthosie, also known as Jupiter XXXV, is a natural satellite of Jupiter. It was discovered by a team of astronomers from the University of Hawaii led by Scott S. Sheppard in 2001, and given the temporary designation S/2001 J 9.\n\nOrthosie is about 2 kilometres in diameter, and orbits Jupiter at an average distance of 20,568 Mm in 602.619 days, at an inclination of 142° to the ecliptic (143° to Jupiter's equator), in a retrograde direction and with an eccentricity of 0.2433.\n\nIt was named in August 2003 after Orthosie, the Greek goddess of prosperity and one of the Horae. The Horae (Hours) were daughters of Zeus and Themis.\n\nOrthosie belongs to the Ananke group, retrograde irregular moons that orbit Jupiter between 19.3 and 22.7 Gm, at inclinations of roughly 150°.",
                       wiki: "https://en.wikipedia.org/wiki/Orthosie_(moon)",
                       nasa: "http://solarsystem.nasa.gov/planets/orthosie")
        
        Jupiter.moons.append(Orthosie)
        
        let Iocaste = Moon(name: "Iocaste",
                           position: 26)
        
        Iocaste.about(description: "Iocaste, also known as Jupiter XXIV, is a retrograde irregular satellite of Jupiter. It was discovered by a team of astronomers from the University of Hawaii led by Scott S. Sheppard in 2000, and given the temporary designation S/2000 J 3.\n\nIocaste orbits Jupiter at an average distance of 20,723 million kilometers in 609.427 days, at an inclination of 147° to the ecliptic (146° to Jupiter's equator) with an eccentricity of 0.2874.\n\nIt was named in October 2002 after Jocasta, the mother/wife of Oedipus in Greek mythology.\n\nIocaste belongs to the Ananke group, believed to be the remnants of a break-up of a captured heliocentric asteroid.\n\nThe satellite is about 5 kilometres in diameter and appears grey (colour indices B−V=0.63, R−V=0.36), similar to C-type asteroids.",
                      wiki: "https://en.wikipedia.org/wiki/Iocaste_(moon)",
                      nasa: "http://solarsystem.nasa.gov/planets/iocaste")
        
        Jupiter.moons.append(Iocaste)
        
        let J16 = Moon(name: "S/2003 J 16",
                       position: 27)
        
        J16.about(description: "S/2003 J 16 is a natural satellite of Jupiter. It was discovered by a team of astronomers led by Brett J. Gladman in 2003.\n\nS/2003 J 16 is about 2 kilometres in diameter, and orbits Jupiter at an average distance of 20,744 Mm in 610.362 days, at an inclination of 151° to the ecliptic (149° to Jupiter's equator), in a retrograde direction and with an eccentricity of 0.3185.\n\nIt belongs to the Ananke group, retrograde irregular moons which orbit Jupiter between 19.3 and 22.7 Gm, at inclinations of roughly 150°.",
                  wiki: "https://en.wikipedia.org/wiki/S/2003_J_16",
                  nasa: "http://solarsystem.nasa.gov/planets/s2003j16")
        
        Jupiter.moons.append(J16)
        
        let Praxidike = Moon(name: "Praxidike",
                             position: 28)
        
        Praxidike.about(description: "Praxidike, also known as Jupiter XXVII, is a retrograde irregular satellite of Jupiter. It was discovered by a team of astronomers from the University of Hawaii led by Scott S. Sheppard in 2000, and given the temporary designation S/2000 J 7.\n\nPraxidike orbits Jupiter at an average distance of 20,824 Mm in 613.904 days, at an inclination of 144° to the ecliptic (143° to Jupiter's equator), in a retrograde direction and with an eccentricity of 0.1840.\n\nIt was named in August 2003 after Praxidike, the Greek goddess of punishment.\n\nPraxidike belongs to the Ananke group, believed to be the remnants of a break-up of a captured heliocentric asteroid. With an estimated diameter of 7 km, Praxidike is the second largest member of the group after Ananke itself (assumed albedo of 0.04).\n\nThe satellite appears grey (colour indices B-V=0.77, R-V= 0.34), typical of C-type asteroids.",
                        wiki: "https://en.wikipedia.org/wiki/Praxidike_(moon)",
                        nasa: "http://solarsystem.nasa.gov/planets/praxidike")
        
        Jupiter.moons.append(Praxidike)
        
        let Harpalyke = Moon(name: "Harpalyke",
                             position: 29)
        
        Harpalyke.about(description: "Harpalyke, also known as Jupiter XXII, is a retrograde irregular satellite of Jupiter. It was discovered by a team of astronomers from the University of Hawaii led by Scott S. Sheppard in 2000, and given the temporary designation S/2000 J 5. In August 2003, the moon was named after Harpalyke, the incestuous daughter of Klymenos, who in some accounts was also a lover of Zeus (Jupiter).\n\nHarpalyke belongs to the Ananke group, believed to be the remnants of a break-up of a captured heliocentric asteroid. It is about 4 kilometres in diameter and appears grey (color index R-V=0.43), similar to C-type asteroids. The satellite orbits Jupiter at an average distance of 21,064 Mm in 624.542 Earth days, at an inclination of 147° to the ecliptic (147° to Jupiter's equator) with an eccentricity of 0.2441.",
                        wiki: "https://en.wikipedia.org/wiki/Harpalyke_(moon)",
                        nasa: "http://solarsystem.nasa.gov/planets/harpalyke")
        
        Jupiter.moons.append(Harpalyke)
        
        let Mneme = Moon(name: "Mneme",
                         position: 30)
        
        Mneme.about(description: "Mneme, also known as Jupiter XL, is a retrograde irregular satellite of Jupiter. It was discovered by a team of astronomers from the University of Hawaii led by Scott S. Sheppard, et al. in 2003, and was provisionally designated S/2003 J 21.\n\nMneme is about 2 kilometres in diameter, and orbits Jupiter at an average distance of 21.427 million kilometres in 640.769 days, at an inclination of 149° to the ecliptic (148° to Jupiter's equator) with an eccentricity of 0.2214. Its average orbital speed is 2.43 km/s.\n\nIt was named in March 2005 after Mneme, one of the three original Muses. She is sometimes confused with Mnemosyne, mother of the Muses (the three or the nine, depending on the author) by Zeus (Jupiter).\n\nMneme belongs to the Ananke group, retrograde irregular moons which orbit Jupiter between 19.3 and 22.7 million kilometres, at inclinations of roughly 150°.",
                    wiki: "https://en.wikipedia.org/wiki/Mneme_(moon)",
                    nasa: "http://solarsystem.nasa.gov/planets/mneme")
        
        Jupiter.moons.append(Mneme)
        
        let Hermippe = Moon(name: "Hermippe",
                            position: 31)
        
        Hermippe.about(description: "Hermippe, or Jupiter XXX, is a natural satellite of Jupiter. It was discovered by a team of astronomers from the Institute for Astronomy of the University of Hawaii led by David Jewitt and Scott S. Sheppard in 2001, and given the temporary designation S/2001 J 3.\n\nHermippe is about 4 kilometres in diameter, and orbits Jupiter at an average distance of 21 million kilometers in about 630 days, at an inclination of 151° to the ecliptic (149° to Jupiter's equator), in a retrograde direction and with an eccentricity of 0.2290.\n\nIt was named in August 2003 by the IAU, after Hermippe, a lover of Zeus (Jupiter).\n\nHermippe belongs to the Ananke group, retrograde irregular moons which orbit Jupiter between 19.3 and 22.7 gigametres (0.152 astronomical units), at inclinations of roughly 150°.",
                       wiki: "https://en.wikipedia.org/wiki/Hermippe_(moon)",
                       nasa: "http://solarsystem.nasa.gov/planets/hermippe")
        
        Jupiter.moons.append(Hermippe)
        
        let Thyone = Moon(name: "Thyone",
                          position: 32)
        
        Thyone.about(description: "Thyone, also known as Jupiter XXIX, is a retrograde irregular satellite of Jupiter. It was discovered by a team of astronomers from the University of Hawaii led by Scott S. Sheppard, et al. in 2001, and given the temporary designation S/2001 J 2.\n\nThyone is about 4 kilometres in diameter, and orbits Jupiter at an average distance of 21.406 million kilometres in 639.803 days, at an inclination of 147° to the ecliptic (147° to Jupiter's equator) with an eccentricity of 0.2526. Its average orbital speed is 2.43 km/s.\n\nIt was named in August 2003 after Thyone, better known as Semele, mother of Dionysus in Greek mythology.\n\nThyone belongs to the Ananke group, retrograde irregular moons which orbit Jupiter between 19.3 and 22.7 million kilometres, at inclinations of roughly 150°.",
                     wiki: "https://en.wikipedia.org/wiki/Thyone_(moon)",
                     nasa: "http://solarsystem.nasa.gov/planets/thyone")
        
        Jupiter.moons.append(Thyone)
        
        let Ananke = Moon(name: "Ananke",
                          position: 33)
        
        Ananke.about(description: "Ananke is a retrograde irregular moon of Jupiter. It was discovered by Seth Barnes Nicholson at Mount Wilson Observatory in 1951 and is named after the mythological Ananke, the personification of Necessity, and the mother of the Moirai by Zeus. The adjectival form of the name is Anankean.\n\nAnanke did not receive its present name until 1975; before then, it was simply known as Jupiter XII. It was sometimes called \"Adrastea\" between 1955 and 1975 (Adrastea is now the name of another satellite of Jupiter).\n\nAnanke gives its name to the Ananke group, retrograde irregular moons which orbit Jupiter between 19.3 and 22.7 Gm, at inclinations of roughly 150°.\n\nAnanke orbits Jupiter on a high eccentricity and high inclination retrograde orbit. Eight irregular satellites orbiting Jupiter have been discovered since 2000 following similar orbits. The orbital elements are as of January 2000. They are continuously changing due to Solar and planetary perturbations. The diagram illustrates Ananke's orbit in relation to other retrograde irregular satellites of Jupiter. The eccentricity of selected orbits is represented by the yellow segments (extending from the pericentre to the apocentre). The outermost regular satellite Callisto is located for reference.\n\nGiven these orbital elements and the physical characteristics known so far, Ananke is thought to be the largest remnant of an original break-up forming the Ananke group.",
                     wiki: "https://en.wikipedia.org/wiki/Ananke_(moon)",
                     nasa: "http://solarsystem.nasa.gov/planets/ananke")
        
        Jupiter.moons.append(Ananke)
        
        let Herse = Moon(name: "Herse",
                         position: 34)
        
        Herse.about(description: "Herse, or Jupiter L, previously known by its provisional designation of S/2003 J 17, is a natural satellite of Jupiter. It was discovered on 8 February 2003 by the astronomers Brett J. Gladman, John J. Kavelaars, Jean-Marc Petit, and Lynne Allen and also by a team of astronomers at the University of Hawaii. It was named after Herse 'dew', a daughter of Zeus and Selene the moon in Greek mythology, on 11 November 2009.\n\nHerse is about 2 kilometres in diameter, and orbits Jupiter at an average distance of 22.134 gigametre (Gm) in 672.752 days, at a mean inclination of 165° to the ecliptic, in a retrograde direction and with a mean eccentricity of 0.2493.\n\nIt is the innermost member of the Carme group, made up of irregular retrograde moons orbiting Jupiter at a distance ranging between 23 and 24 Gm and at an inclination of about 165°.",
                    wiki: "https://en.wikipedia.org/wiki/Herse_(moon)",
                    nasa: "http://solarsystem.nasa.gov/planets/herse")
        
        Jupiter.moons.append(Herse)
        
        let Aitne = Moon(name: "Aitne",
                         position: 35)
        
        Aitne.about(description: "Aitne, also known as Jupiter XXXI, is a retrograde irregular satellite of Jupiter. It was discovered by a team of astronomers from the University of Hawaii led by Scott S. Sheppard, et al. in 2001, and given the temporary designation S/2001 J 11. Aitne belongs to the Carme group, made up of irregular retrograde moons orbiting Jupiter at a distance ranging between 23 and 24 Gm and at an inclination of about 165°.\n\nAitne is about 3 kilometres in diameter, and orbits Jupiter at an average distance of 22,285 Mm in 679.641 days, at an inclination of 166° to the ecliptic (164° to Jupiter's equator), in a retrograde direction and with an eccentricity of 0.393.\n\nIt was named in August 2003 after Aitna or Aitne, the divine personification of Mount Etna, whose sons by Zeus (Jupiter) are the Palici, the twin Sicilian gods of geysers (other authors have them descend from Thalia and/or Hephaistos).",
                    wiki: "https://en.wikipedia.org/wiki/Aitne_(moon)",
                    nasa: "http://solarsystem.nasa.gov/planets/aitne")
        
        Jupiter.moons.append(Aitne)
        
        let Kale = Moon(name: "Kale",
                        position: 36)
        
        Kale.about(description: "Kale, also known as Jupiter XXXVII, is a retrograde irregular satellite of Jupiter. It was discovered in 2001 by astronomers Scott S. Sheppard, D. Jewitt, and J. Kleyna, and was originally designated as S/2001 J 8.\n\nKale is about 2 kilometres in diameter, and orbits Jupiter at an average distance of 22,409 Mm in 685.324 days, at an inclination of 165° to the ecliptic (166° to Jupiter's equator), in a retrograde direction and with an eccentricity of 0.2011.\n\nIt was named in August 2003 after one of the Charites (Greek Χάριτες, Latin Gratiae, \"Graces\"), daughters of Zeus (Jupiter). Kale is the spouse of Hephaestus according to some authors (although most have Aphrodite play that role).\n\nIt belongs to the Carme group, made up of irregular retrograde moons orbiting Jupiter at a distance ranging between 23 and 24 Gm and at an inclination of about 165°.",
                   wiki: "https://en.wikipedia.org/wiki/Kale_(moon)",
                   nasa: "http://solarsystem.nasa.gov/planets/kale")
        
        Jupiter.moons.append(Kale)
        
        let Taygete = Moon(name: "Taygete",
                           position: 37)
        
        Taygete.about(description: "Taygete, also known as Jupiter XX, is a retrograde irregular satellite of Jupiter. It was discovered by a team of astronomers from the University of Hawaii led by Scott S. Sheppard, et al. in 2000, and given the temporary designation S/2000 J 9.\n\nTaygete is about 5 kilometres in diameter, and orbits Jupiter at an average distance of 22,439 Mm in 686.675 days, at an inclination of 165° to the ecliptic (163° to Jupiter's equator), in a retrograde direction and with an eccentricity of 0.3678.\n\nIt was named in October 2002 after Taygete, one of the Pleiades, daughter of the Titan Atlas and mother of Lacedaemon by Zeus (Jupiter).\n\nIt belongs to the Carme group, made up of irregular retrograde moons orbiting Jupiter at a distance ranging between 23 and 24 Gm and at an inclination of about 165°.",
                      wiki: "https://en.wikipedia.org/wiki/Taygete_(moon)",
                      nasa: "http://solarsystem.nasa.gov/planets/taygete")
        
        Jupiter.moons.append(Taygete)
        
        let J19 = Moon(name: "S/2003 J 19",
                       position: 38)
        
        J19.about(description: "S/2003 J 19 is a natural satellite of Jupiter. It was discovered by a team of astronomers led by Brett J. Gladman, et al. in 2003.\n\nS/2003 J 19 is about 2 kilometres in diameter, and orbits Jupiter at an average distance of 22,709 Mm in 699.125 days, at an inclination of 165° to the ecliptic (164° to Jupiter's equator), in a retrograde direction and with an eccentricity of 0.1961.\n\nIt belongs to the Carme group, made up of irregular retrograde moons orbiting Jupiter at a distance ranging between 23 and 24 Gm and at an inclination of about 165°.",
                  wiki: "https://en.wikipedia.org/wiki/S/2003_J_19",
                  nasa: "http://solarsystem.nasa.gov/planets/s2003j19")
        
        Jupiter.moons.append(J19)
        
        let Chaldene = Moon(name: "Chaldene",
                            position: 39)
        
        Chaldene.about(description: "Chaldene, also known as Jupiter XXI, is a retrograde irregular satellite of Jupiter. It was discovered by a team of astronomers from the University of Hawaii led by Scott S. Sheppard, et al., in 2000, and given the temporary designation S/2000 J 10.\n\nChaldene is about 3.8 kilometres in diameter, and orbits Jupiter at an average distance of 22,713 Mm in 699.327 days, at an inclination of 167° to the ecliptic (169° to Jupiter's equator), in a retrograde direction and with an eccentricity of 0.2916.\n\nIt was named in October 2002 after Chaldene, the mother of Solymos by Zeus in Greek mythology.\n\nIt belongs to the Carme group, made up of irregular retrograde moons orbiting Jupiter at a distance ranging between 23 and 24 Gm and at an inclination of about 165°.",
                       wiki: "https://en.wikipedia.org/wiki/Chaldene",
                       nasa: "http://solarsystem.nasa.gov/planets/chaldene")
        
        Jupiter.moons.append(Chaldene)
        
        let J15 = Moon(name: "S/2003 J 15",
                       position: 40)
        
        J15.about(description: "S/2003 J 15 is a natural satellite of Jupiter. It was discovered by a team of astronomers from the University of Hawaii led by Scott S. Sheppard, et al. in 2003.\n\nS/2003 J 15 is about 2 kilometres in diameter, and orbits Jupiter at an average distance of 22,721 Mm in 699.676 days, at an inclination of 142° to the ecliptic (142° to Jupiter's equator), in a retrograde direction and with an eccentricity of 0.0932.\n\nIt is the outermost member of the Ananke group, retrograde irregular moons which orbit Jupiter between 19.3 and 22.7 Gm, at inclinations of roughly 150°.",
                  wiki: "https://en.wikipedia.org/wiki/S/2003_J_15",
                  nasa: "http://solarsystem.nasa.gov/planets/s2003j15")
        
        Jupiter.moons.append(J15)
        
        let J10 = Moon(name: "S/2003 J 10",
                       position: 41)
        
        J10.about(description: "S/2003 J 10 is a retrograde irregular satellite of Jupiter. It was discovered by a team of astronomers from the University of Hawaii led by Scott S. Sheppard et al. in 2003.\n\nS/2003 J 10 is about 2 kilometres in diameter, and orbits Jupiter at an average distance of 22,731 Mm in 700.129 days, at an inclination of 164° to the ecliptic (166° to Jupiter's equator), in a retrograde direction and with an eccentricity of 0.3438.\n\nIt belongs to the Carme group, made up of irregular retrograde moons orbiting Jupiter at a distance ranging between 23 and 24 Gm and at an inclination of about 165°.",
                  wiki: "https://en.wikipedia.org/wiki/S/2003_J_10",
                  nasa: "http://solarsystem.nasa.gov/planets/s2003j10")
        
        Jupiter.moons.append(J10)
        
        let J23 = Moon(name: "S/2003J 23",
                       position: 42)
        
        J23.about(description: "S/2003 J 23 is a natural satellite of Jupiter. It was discovered by a team of astronomers from the University of Hawaii led by Scott S. Sheppard et al. in 2004 from pictures taken in 2003.\n\nS/2003 J 23 is about 2 kilometres in diameter, and orbits Jupiter at an average distance of 22,740 Mm in 700.538 days, at an inclination of 149° to the ecliptic (149° to Jupiter's equator), in a retrograde direction and with an eccentricity of 0.3931.\n\nIt belongs to the Pasiphae group, irregular retrograde moons orbiting Jupiter at distances ranging between 22.8 and 24.1 Gm, and with inclinations ranging between 144.5° and 158.3°.",
                  wiki: "https://en.wikipedia.org/wiki/S/2003_J_23",
                  nasa: "http://solarsystem.nasa.gov/planets/s2003j23")
        
        Jupiter.moons.append(J23)
        
        let Erinome = Moon(name: "Erinome",
                           position: 43)
        
        Erinome.about(description: "Erinome, also known as Jupiter XXV, is a retrograde irregular satellite of Jupiter. It was discovered by a team of astronomers from the University of Hawaii led by Scott S. Sheppard et al. in 2000, and given the temporary designation S/2000 J 4.\n\nErinome is about 3.2 kilometres in diameter, and orbits Jupiter at an average distance of 22,986 Mm in 711.965 days, at an inclination of 164° to the ecliptic (162° to Jupiter's equator), in a retrograde direction and with an eccentricity of 0.2552.\n\nIt was named in October 2002 after the mythological Erinome, said to be a \"daughter of Celes, compelled by Venus to fall in love with Jupiter.\"\n\nErinome belongs to the Carme group, made up of irregular retrograde moons orbiting Jupiter at a distance ranging between 23 and 24 Gm and at an inclination of about 165°.",
                      wiki: "https://en.wikipedia.org/wiki/Erinome",
                      nasa: "http://solarsystem.nasa.gov/planets/erinome")
        
        Jupiter.moons.append(Erinome)
        
        let Aoede = Moon(name: "Aoede",
                         position: 44)
        
        Aoede.about(description: "Aoede, also known as Jupiter XLI, is a natural satellite of Jupiter. It was discovered by a team of astronomers from the University of Hawaii led by Scott S. Sheppard in 2003. It received the temporary designation S/2003 J 7.\n\nAoede is about 4 kilometres in diameter, and orbits Jupiter at an average distance of 23,044 Mm in 714.657 days, at an inclination of 160° to the ecliptic (162° to Jupiter's equator), in a retrograde direction and with an eccentricity of 0.4311.\n\nIt was named in March 2005 after Aœde, one of the three original Muses. Aœde was the Muse of song, and was a daughter of Zeus (Jupiter) by Mnemosyne.\n\nAoede belongs to the Pasiphae group, irregular retrograde moons orbiting Jupiter at distances ranging between 22.8 and 24.1 Gm, and with inclinations ranging between 144.5° and 158.3°.",
                    wiki: "https://en.wikipedia.org/wiki/Aoede_(moon)",
                    nasa: "http://solarsystem.nasa.gov/planets/aoede")
        
        Jupiter.moons.append(Aoede)
        
        let Kallichore = Moon(name: "Kallichore",
                              position: 45)
        
        Kallichore.about(description: "Kallichore, also known as Jupiter XLIV, is a natural satellite of Jupiter. It was discovered by a team of astronomers from the University of Hawaii led by Scott S. Sheppard, et al. in 2003. It received the temporary designation S/2003 J 11.\n\nKallichore is about 2 kilometres in diameter, and orbits Jupiter at an average distance of 23,112 Mm in 717.806 days, at an inclination of 165° to the ecliptic (164° to Jupiter's equator), in a retrograde direction and with an eccentricity of 0.2042.\n\nIt was named in March 2005 after the nymph Kallichore.\n\nKallichore belongs to the Carme group, made up of irregular retrograde moons orbiting Jupiter at a distance ranging between 23 and 24 Gm and at an inclination of about 165°.",
                         wiki: "https://en.wikipedia.org/wiki/Kallichore_(moon)",
                         nasa: "http://solarsystem.nasa.gov/planets/kallichore")
        
        Jupiter.moons.append(Kallichore)
        
        let Kalyke = Moon(name: "Kalyke",
                          position: 46)
        
        Kalyke.about(description: "Kalyke, also known as Jupiter XXIII, is a retrograde irregular satellite of Jupiter. It was discovered by a team of astronomers from the University of Hawaii led by Scott S. Sheppard et al. in 2000, and given the temporary designation S/2000 J 2.\n\nKalyke is about 5.2 kilometres in diameter, and orbits Jupiter at an average distance of 23,181 Mm in 721.021 days, at an inclination of 166° to the ecliptic (165° to Jupiter's equator), in a retrograde direction and with an eccentricity of 0.2140.\n\nIt was named in October 2002 after the Greek mythological figure Kalyke or Calyce.\n\nIt belongs to the Carme group, made up of irregular retrograde moons orbiting Jupiter at a distance ranging between 23 and 24 Gm and at an inclination of about 165°.",
                     wiki: "https://en.wikipedia.org/wiki/Kalyke",
                     nasa: "http://solarsystem.nasa.gov/planets/kalyke")
        
        Jupiter.moons.append(Kalyke)
        
        let Carme = Moon(name: "Carme",
                         position: 47)
        
        Carme.about(description: "Carme is a retrograde irregular satellite of Jupiter. It was discovered by Seth Barnes Nicholson at Mount Wilson Observatory in California in July 1938. It is named after the mythological Carme, mother by Zeus of Britomartis, a Cretan goddess.\n\nCarme did not receive its present name until 1975; before then, it was simply known as Jupiter XI. It was sometimes called \"Pan\" between 1955 and 1975 (Pan is now the name of a satellite of Saturn).\n\nIt gives its name to the Carme group, made up of irregular retrograde moons orbiting Jupiter at a distance ranging between 23 and 24 Gm and at an inclination of about 165°. Its orbital elements are as of January 2000. They are continuously changing due to solar and planetary perturbations.",
                    wiki: "https://en.wikipedia.org/wiki/Carme_(moon)",
                    nasa: "http://solarsystem.nasa.gov/planets/carme")
        
        Jupiter.moons.append(Carme)
        
        let Callirrhoe = Moon(name: "Callirrhoe",
                              position: 48)
        
        Callirrhoe.about(description: "Callirrhoe, also known as Jupiter XVII (17), is one of Jupiter's outermost named natural satellites. It is an irregular moon that orbits in a retrograde direction. Callirrhoe was imaged by Spacewatch at Kitt Peak National Observatory from October 6 through November 4, 1999, and originally designated as asteroid (1999 UX18). It was discovered to be in orbit around Jupiter by Tim Spahr on July 18, 2000, and then given the designation S/1999 J 1. It was the 17th confirmed moon of Jupiter.\n\nCallirrhoe has an apparent magnitude of 20.7, making it even fainter than dwarf planet Eris at magnitude 18.7. Jupiter is about 2.5 billion times brighter than Callirrhoe.\n\nCallirrhoe is about 8.6 kilometers in diameter, and orbits Jupiter at an average distance of 24.1 million kilometers in 758 days, at an inclination of 141° to the ecliptic (140° to Jupiter's equator) with an eccentricity of 0.28. This object was probably captured long ago from a heliocentric orbit and the Sun's gravitational influence makes this orbit highly erratic.\n\nIt was named in October 2002 after Callirrhoe, daughter of the river god Achelous, one of Zeus' (Jupiter's) many conquests.\n\nIt belongs to the Pasiphae group, irregular retrograde moons orbiting Jupiter at distances ranging between 22.8 and 24.1 million kilometers, and with inclinations ranging between 144.5° and 158.3°.\n\nAs a navigation exercise, the New Horizons spacecraft imaged it on January 10, 2007.",
                         wiki: "https://en.wikipedia.org/wiki/Callirrhoe_(moon)",
                         nasa: "http://solarsystem.nasa.gov/planets/callirrhoe")
        
        Jupiter.moons.append(Callirrhoe)
        
        let Eurydome = Moon(name: "Eurydome",
                            position: 49)
        
        Eurydome.about(description: "Eurydome, also known as Jupiter XXXII, is a natural satellite of Jupiter. It was discovered by a team of astronomers from the University of Hawaii led by Scott S. Sheppard in 2001, and given the temporary designation S/2001 J 4.\n\nEurydome is about 3 kilometres in diameter, and orbits Jupiter at an average distance of 23,231 Mm in 723.359 days, at an inclination of 149° to the ecliptic (147° to Jupiter's equator), in a retrograde direction and with an eccentricity of 0.3770.\n\nIt was named in August 2003 after Eurydome in Greek mythology, who is sometimes described as the mother of the Graces by Zeus (Jupiter).\n\nEurydome belongs to the Pasiphae group, irregular retrograde moons orbiting Jupiter at distances ranging between 22.8 and 24.1 Gm, and with inclinations ranging between 144.5° and 158.3°.",
                       wiki: "https://en.wikipedia.org/wiki/Eurydome_(moon)",
                       nasa: "http://solarsystem.nasa.gov/planets/eurydome")
        
        Jupiter.moons.append(Eurydome)
        
        let J2_2011 = Moon(name: "S/2011 J 2",
                           position: 50)
        
        J2_2011.about(description: "S/2011 J 2 is a natural satellite of Jupiter. It was discovered by Scott Sheppard in 2011. Images of the newly discovered moon were captured using the Magellan-Baade telescope at the Las Campanas Observatory in Chile. It is an irregular moon with a retrograde orbit. The discovery of S/2011 J 2 brought the Jovian satellite count to 67. It is one of the outer retrograde swarm of objects orbiting Jupiter.",
                      wiki: "https://en.wikipedia.org/wiki/S/2011_J_2",
                      nasa: "http://solarsystem.nasa.gov/planets/s2011j2")
        
        Jupiter.moons.append(J2_2011)
        
        let Pasithee = Moon(name: "Pasithee",
                            position: 51)
        
        Pasithee.about(description: "Pasithee, also known as Jupiter XXXVIII, is a retrograde irregular satellite of Jupiter. It was discovered by a team of astronomers from the University of Hawaii led by Scott S. Sheppard in 2001, and given the temporary designation S/2001 J 6.\n\nPasithee is about 2 kilometres in diameter, and orbits Jupiter at an average distance of 23,307 Mm in 727.933 days, at an inclination of 166° to the ecliptic (164° to Jupiter's equator), in a retrograde direction and with an eccentricity of 0.3289.\n\nIt was named in August 2003 after Pasithee, one of the Charites, goddesses of charm, beauty, nature, human creativity and fertility, daughters of Zeus (Jupiter) by Eurynome. Pasithee, better known as Aglaea, is the spouse of Hypnos (Sleep) and presides to hallucinations and hallucinogens.\n\nIt belongs to the Carme group, made up of irregular retrograde moons orbiting Jupiter at a distance ranging between 23 and 24 Gm and at an inclination of about 165°.",
                       wiki: "https://en.wikipedia.org/wiki/Pasithee_(moon)",
                       nasa: "http://solarsystem.nasa.gov/planets/pasithee")
        
        Jupiter.moons.append(Pasithee)
        
        let J1_2010 = Moon(name: "Jupiter LI",
                           position: 52)
        
        J1_2010.about(description: "Jupiter LI, also known as S/2010 J 1, is a natural satellite of Jupiter. It was discovered by R. Jacobson, M. Brozović, B. Gladman, and M. Alexandersen in 2010. It received its permanent number in March 2015. It is now known to circle Jupiter at an average distance of 23.45 million km, taking 2.02 years to complete an orbit around Jupiter. S/2010 J 1 is about 3 km wide.",
                      wiki: "https://en.wikipedia.org/wiki/Jupiter_LI",
                      nasa: "http://solarsystem.nasa.gov/planets/s2010j1")
        
        Jupiter.moons.append(J1_2010)
        
        let Kore = Moon(name: "Kore",
                        position: 53)
        
        Kore.about(description: "Kore, also known as Jupiter XLIX, is a natural satellite of Jupiter. It was discovered by a team of astronomers from the University of Hawaii led by Scott S. Sheppard in 2003 and given the provisional designation S/2003 J 14.\n\nKore is about 2 kilometers in diameter, and orbits Jupiter at an average distance of 23,239 Mm in 723.720 days, at an inclination of 141° to the ecliptic (139° to Jupiter's equator), in a retrograde direction and with an eccentricity of 0.2462.\n\nIt belongs to the Pasiphae group, which is made up of irregular retrograde moons orbiting Jupiter at distances ranging between 22.8 and 24.1 Gm, and with inclinations ranging between 144.5° and 158.3°.\n\nIt was named after Kore, another name for the Greek goddess Persephone (from the Greek κόρη, \"daughter [of Demeter]\").",
                   wiki: "https://en.wikipedia.org/wiki/Kore_(moon)",
                   nasa: "http://solarsystem.nasa.gov/planets/kore")
        
        Jupiter.moons.append(Kore)
        
        let Cyllene = Moon(name: "Cyllene",
                           position: 54)
        
        Cyllene.about(description: "Cyllene, also known as Jupiter XLVIII, is a natural satellite of Jupiter. It was discovered by a team of astronomers from the University of Hawaii led by Scott S. Sheppard in 2003, receiving the temporary designation S/2003 J 13.\n\nCyllene is about 2 kilometres in diameter, and orbits Jupiter at an average distance of 23,396 Mm in 731.099 days, at an inclination of 140° to the ecliptic (140° to Jupiter's equator), in a retrograde direction and with an eccentricity of 0.4116.\n\nIt was named in March 2005 after Cyllene, a naiad (stream nymph) or oread (mountain nymph) associated with Mount Kyllini, Greece. She was a daughter of Zeus (Jupiter).\n\nIt belongs to the Pasiphae group, irregular retrograde moons orbiting Jupiter at distances ranging between 22.8 and 24.1 Gm, and with inclinations ranging between 144.5° and 158.3°.",
                      wiki: "https://en.wikipedia.org/wiki/Cyllene_(moon)",
                      nasa: "http://solarsystem.nasa.gov/planets/cyllene")
        
        Jupiter.moons.append(Cyllene)
        
        let Eukelade = Moon(name: "Eukelade",
                            position: 55)
        
        Eukelade.about(description: "Eukelade, also known as Jupiter XLVII, is a retrograde irregular satellite of Jupiter. It was discovered by a team of astronomers from the University of Hawaii led by Scott S. Sheppard in 2003, and received the temporary designation S/2003 J 1.\n\nEukelade is about 4 kilometres in diameter, and orbits Jupiter at an average distance of 23,484 Mm in 735.200 days, at an inclination of 164° to the ecliptic (165° to Jupiter's equator), in a retrograde direction and with an eccentricity of 0.2829.\n\nIt was named in March 2005 after Eukelade, described by some Greek writers as one of the Muses, and thus a daughter of Zeus (Jupiter).Eukelade belongs to the Carme group, made up of irregular retrograde moons orbiting Jupiter at a distance ranging between 23 and 24 Gm and at an inclination of about 165°.",
                       wiki: "https://en.wikipedia.org/wiki/Eukelade",
                       nasa: "http://solarsystem.nasa.gov/planets/eukelade")
        
        Jupiter.moons.append(Eukelade)
        
        let J4 = Moon(name: "S/2003 J 4",
                      position: 56)
        
        J4.about(description: "S/2003 J 4 is a natural satellite of Jupiter. It was discovered by a team of astronomers from the University of Hawaii led by Scott S. Sheppard in 2003.\n\nS/2003 J 4 is about 2 km in diameter, and orbits Jupiter at an average distance of 23,571 Mm in 739.294 days, at an inclination of 147° to the ecliptic (149° to Jupiter's equator), in a retrograde direction and with an eccentricity of 0.3003.\n\nIt belongs to the Pasiphae group, irregular retrograde moons orbiting Jupiter at distances ranging between 22.8 and 24.1 Gm, and with inclinations ranging between 144.5° and 158.3°.",
                 wiki: "https://en.wikipedia.org/wiki/S/2003_J_4",
                 nasa: "http://solarsystem.nasa.gov/planets/s2003j04")
        
        Jupiter.moons.append(J4)
        
        let Pasiphae = Moon(name: "Pasiphae",
                            position: 57)
        
        Pasiphae.about(description: "Pasiphae is a retrograde irregular satellite of Jupiter. It was discovered in 1908 by Philibert Jacques Melotte and later named after the mythological Pasiphaë, wife of Minos and mother of the Minotaur from Greek legend.\n\nIt was first spotted on a plate taken at the Royal Greenwich Observatory on the night of February 28, 1908. Inspection of previous plates found it as far back as January 27. It received the provisional designation 1908 CJ, as it was not clear whether it was an asteroid or a moon of Jupiter. The recognition of the latter case came by April 10.\n\nPasiphae did not receive its present name until 1975; before then, it was simply known as Jupiter VIII. It was sometimes called \"Poseidon\" between 1955 and 1975.",
                       wiki: "https://en.wikipedia.org/wiki/Pasiphae_(moon)",
                       nasa: "http://solarsystem.nasa.gov/planets/pasiphae")
        
        Jupiter.moons.append(Pasiphae)
        
        let Hegemone = Moon(name: "Hegemone",
                            position: 58)
        
        Hegemone.about(description: "Hegemone, also known as Jupiter XXXIX, is a natural satellite of Jupiter. It was discovered by a team of astronomers from the University of Hawaii led by Scott S. Sheppard in 2003, and given the temporary designation S/2003 J 8.Hegemone is about 3 kilometres in diameter, and orbits Jupiter at an average distance of 23,703 Mm in 745.500 days, at an inclination of 153° to the ecliptic (151° to Jupiter's equator), in a retrograde direction and with an eccentricity of 0.4077.\n\nIt was named in March 2005 after Hegemone, one of the Graces, and a daughter of Zeus (Jupiter).\n\nHegemone belongs to the Pasiphae group, irregular retrograde moons orbiting Jupiter at distances ranging between 22.8 and 24.1 Gm, and with inclinations ranging between 144.5° and 158.3°.",
                       wiki: "https://en.wikipedia.org/wiki/Hegemone_(moon)",
                       nasa: "http://solarsystem.nasa.gov/planets/hegemone")
        
        Jupiter.moons.append(Hegemone)
        
        let Arche = Moon(name: "Arche",
                         position: 59)
        
        Arche.about(description: "Arche, also known as Jupiter XLIII, is a moon of Jupiter. It was discovered by a team of astronomers from the University of Hawaii led by Scott S. Sheppard in 2002, and received the temporary designation S/2002 J 1.\n\nArche is about 3 kilometres in diameter, and orbits Jupiter at an average distance of 23,717 Mm in 746.185 days, at an inclination of 165° to the ecliptic (162° to Jupiter's equator), in a retrograde direction and with an eccentricity of 0.149.\n\nIt was named in 2005 after Arche, whom some Greek writers described as one of the four original Muses, an addition to the earlier three (Aoede, Melete, and Mneme).\n\nArche belongs to the Carme group, made up of irregular retrograde moons orbiting Jupiter at a distance ranging between 23 and 24 Gm and at an inclination of about 165°.",
                    wiki: "https://en.wikipedia.org/wiki/Arche_(moon)",
                    nasa: "http://solarsystem.nasa.gov/planets/arche")
        
        Jupiter.moons.append(Arche)
        
        let Isonoe = Moon(name: "Isonoe",
                          position: 60)
        
        Isonoe.about(description: "Isonoe, also known as Jupiter XXVI, is a retrograde irregular satellite of Jupiter. It was discovered by a team of astronomers from the University of Hawaii led by Scott S. Sheppard in 2000, and given the temporary designation S/2000 J 6.\n\nIsonoe is about 3.8 kilometres in diameter, and orbits Jupiter at an average distance of 23,833 Mm in 751.647 days, at an inclination of 166° to the ecliptic (169° to Jupiter's equator), in a retrograde direction and with an eccentricity of 0.166.\n\nIt was named in October 2002 after Isonoe, one of the Danaides in Greek mythology, and a lover of Zeus (Jupiter).\n\nIsonoe belongs to the Carme group, made up of irregular retrograde moons orbiting Jupiter at a distance ranging between 23 and 24 Gm and at an inclination of about 165°.",
                     wiki: "https://en.wikipedia.org/wiki/Isonoe_(moon)",
                     nasa: "http://solarsystem.nasa.gov/planets/isonoe")
        
        Jupiter.moons.append(Isonoe)
        
        let J9 = Moon(name: "S/2003 J 9",
                      position: 61)
        
        J9.about(description: "S/2003 J 9 is a retrograde irregular satellite of Jupiter. It was discovered by a team of astronomers from the University of Hawaii led by Scott S. Sheppard in 2003.\n\nS/2003 J 9 is about 1 kilometre in diameter, and orbits Jupiter at an average distance of 23,858 Mm in 752.839 days, at an inclination of 165° to the ecliptic (165° to Jupiter's equator), in a retrograde direction and with an eccentricity of 0.276.\n\nIt belongs to the Carme group, made up of irregular retrograde moons orbiting Jupiter at a distance ranging between 23 and 24 Gm and at an inclination of about 165°.",
                 wiki: "https://en.wikipedia.org/wiki/S/2003_J_9",
                 nasa: "http://solarsystem.nasa.gov/planets/s2003j09")
        
        Jupiter.moons.append(J9)
        
        let J5 = Moon(name: "S/2003 J 5",
                      position: 62)
        
        J5.about(description: "S/2003 J 5 is a retrograde irregular satellite of Jupiter. It was discovered by a team of astronomers from the University of Hawaii led by Scott S. Sheppard in 2003.\n\nS/2003 J 5 is about 4 kilometres in diameter, and orbits Jupiter at an average distance of 23,974 Mm in 758.341 days, at an inclination of 166° to the ecliptic (167° to Jupiter's equator), in a retrograde direction and with an eccentricity of 0.307.\n\nIt belongs to the Carme group, made up of irregular retrograde moons orbiting Jupiter at a distance ranging between 23 and 24 Gm and at an inclination of about 165°.",
                 wiki: "https://en.wikipedia.org/wiki/S/2003_J_5",
                 nasa: "http://solarsystem.nasa.gov/planets/s2003j05")
        
        Jupiter.moons.append(J5)
        
        let Sinope = Moon(name: "Sinope",
                          position: 63)
        
        Sinope.about(description: "Sinope is a retrograde irregular satellite of Jupiter discovered by Seth Barnes Nicholson at Lick Observatory in 1914, and is named after Sinope of Greek mythology.\n\nSinope did not receive its present name until 1975; before then, it was simply known as Jupiter IX. It was sometimes called \"Hades\" between 1955 and 1975.\n\nSinope was the outermost known moon of Jupiter until the discovery of Megaclite in 2000. The most distant moon of Jupiter now known is S/2003 J 2.\n\nSinope orbits Jupiter on a high eccentricity and high inclination retrograde orbit. The orbital elements are as of January 2000. They are continuously changing due to solar and planetary perturbations. It is often believed to belong to the Pasiphae group. However, given its mean inclination and different colour, Sinope could be also an independent object, captured independently, unrelated to the collision and break-up at the origin of the group. The diagram illustrates Sinope's orbital elements in relation to other satellites of the group.\n\nSinope is also known to be in a secular resonance with Jupiter, similar to Pasiphae. However, Sinope can drop out of this resonance and has periods of both resonant and non resonant behaviour in time scales of 107 years.",
                     wiki: "https://en.wikipedia.org/wiki/Sinope_(moon)",
                     nasa: "http://solarsystem.nasa.gov/planets/sinope")
        
        Jupiter.moons.append(Sinope)
        
        let Sponde = Moon(name: "Sponde",
                          position: 64)
        
        Sponde.about(description: "Sponde, also known as Jupiter XXXVI, is a natural satellite of Jupiter. It was discovered by a team of astronomers from the University of Hawaii led by Scott S. Sheppard in 2001, and given the temporary designation S/2001 J 5.\n\nSponde is about 2 kilometres in diameter, and orbits Jupiter at an average distance of 24,253 Mm in 771.604 days, at an inclination of 154° to the ecliptic (156° to Jupiter's equator), in a retrograde direction and with an eccentricity of 0.443.\n\nIt was named in August 2003 after one of the Horae (Hours), which presided over the seventh hour (libations poured after lunch). The Hours, goddesses of the time of day but also of the seasons, were daughters of Zeus (Jupiter) and Themis.\n\nIt belongs to the Pasiphae group, irregular retrograde moons orbiting Jupiter at distances ranging between 22.8 and 24.1 Gm, and with inclinations ranging between 144.5° and 158.3°.",
                     wiki: "https://en.wikipedia.org/wiki/Sponde",
                     nasa: "http://solarsystem.nasa.gov/planets/sponde")
        
        Jupiter.moons.append(Sponde)
        
        let Autonoe = Moon(name: "Autonoe",
                           position: 65)
        
        Autonoe.about(description: "Autonoe, also known as Jupiter XXVIII, is a natural satellite of Jupiter. It was discovered by a team of astronomers from the University of Hawaii led by Scott S. Sheppard in 2001, and given the temporary designation S/2001 J 1.\n\nAutonoe is about 4 kilometres in diameter, and orbits Jupiter at an average distance of 24,264 Mm in 772.168 days. It orbits at an inclination of 151° to the ecliptic (150° to Jupiter's equator) in a retrograde direction and with an eccentricity of 0.369.\n\nIt belongs to the Pasiphae group, irregular retrograde moons orbiting Jupiter at distances ranging between 22.8 and 24.1 Gm, and with inclinations ranging between 144.5° and 158.3°.\n\nAutonoe was named in August 2003 after the Greek mythological figure Autonoë, conquest of Zeus (Jupiter), mother of the Charites (Gracies), according to some authors.",
                      wiki: "https://en.wikipedia.org/wiki/Autonoe_(moon)",
                      nasa: "http://solarsystem.nasa.gov/planets/autonoe")
        
        Jupiter.moons.append(Autonoe)
        
        let Megaclite = Moon(name: "Megaclite",
                             position: 66)
        
        Megaclite.about(description: "Megaclite, also known as Jupiter XIX, is a natural satellite of Jupiter. It was discovered by a team of astronomers from the University of Hawaii led by Scott S. Sheppard in 2000, and given the temporary designation S/2000 J 8.\n\nMegaclite is about 5.4 kilometres in diameter, and orbits Jupiter at an average distance of 24.687 million kilometers in 792.437 days, at an inclination of 150° to the ecliptic (148° to Jupiter's equator), in a retrograde direction and with an eccentricity of 0.308.\n\nIt was named in October 2002 after Megaclite, mother by Zeus (Jupiter) of Thebe and Locrus in Greek mythology.\n\nIt belongs to the Pasiphae group, irregular retrograde moons orbiting Jupiter at distances ranging between 22.8 and 24.7 Gm, and with inclinations ranging between 144.5° and 158.3°.",
                        wiki: "https://en.wikipedia.org/wiki/Megaclite",
                        nasa: "http://solarsystem.nasa.gov/planets/megaclite")
        
        Jupiter.moons.append(Megaclite)
        
        let J2_2003 = Moon(name: "S/2003 J 2",
                           position: 67)
        
        J2_2003.about(description: "S/2003 J 2 is a retrograde irregular satellite of Jupiter. The discovery, by a team of astronomers from the University of Hawaii led by Scott S. Sheppard and David C. Jewitt, was announced on March 4, 2003. As of 2015, it is Jupiter's outermost known moon.\n\nS/2003 J 2 is about 2 km (1.2 mi) in diameter, and orbits Jupiter at an average distance of 29.54 gigametres (0.1975 AU) in 981.55 days, at an inclination of 154° to the ecliptic (152° to Jupiter's equator) and with an eccentricity of 0.4100.\n\nIt seems to belong to a group all of its own, with semi-major axis ~30 gigametres (0.20 AU) and inclination ~160°.\n\nThe limits of Jupiter's gravitational influence are defined by its Hill sphere, whose radius is 52 gigametres (0.35 AU). Retrograde moons with axes up to 67% of the Hill radius are believed to be stable. Consequently, it is possible that even more distant moons of Jupiter may be discovered.",
                      wiki: "https://en.wikipedia.org/wiki/S/2003_J_2",
                      nasa: "http://solarsystem.nasa.gov/planets/s2003j02")
        
        Jupiter.moons.append(J2_2003)
        
        //----------------------------------------------------------------------------------------------
        let Saturn = Planet(name: "Saturn",
                            type: Type.Gas,
                            position: 6,
                            classification: Class.Major)
        
        Saturn.about(description: "Saturn is the sixth planet from the Sun and the second-largest in the Solar System, after Jupiter. It is a gas giant with an average radius about nine times that of Earth. Although it has only one-eighth the average density of Earth, with its larger volume Saturn is just over 95 times more massive. Saturn is named after the Roman god of agriculture; its astronomical symbol (♄) represents the god's sickle.\n\nSaturn's interior is probably composed of a core of iron–nickel and rock (silicon and oxygen compounds). This core is surrounded by a deep layer of metallic hydrogen, an intermediate layer of liquid hydrogen and liquid helium, and finally outside the Frenkel line a gaseous outer layer. Saturn has a pale yellow hue due to ammonia crystals in its upper atmosphere. Electrical current within the metallic hydrogen layer is thought to give rise to Saturn's planetary magnetic field, which is weaker than Earth's, but has a magnetic moment 580 times that of Earth due to Saturn's larger size. Saturn's magnetic field strength is around one-twentieth of Jupiter's. The outer atmosphere is generally bland and lacking in contrast, although long-lived features can appear. Wind speeds on Saturn can reach 1,800 km/h (500 m/s), higher than on Jupiter, but not as high as those on Neptune.\n\nSaturn has a prominent ring system that consists of nine continuous main rings and three discontinuous arcs and that is composed mostly of ice particles with a smaller amount of rocky debris and dust. Sixty-two moons are known to orbit Saturn, of which fifty-three are officially named. This does not include the hundreds of moonlets comprising the rings. Titan, Saturn's largest moon, and the second-largest in the Solar System, is larger than the planet Mercury, although less massive, and is the only moon in the Solar System to have a substantial atmosphere.",
                     wiki: "https://en.wikipedia.org/wiki/Saturn",
                     nasa: "http://solarsystem.nasa.gov/planets/saturn")
        
        Saturn.display(texture: "saturnmap.jpg",
                       model: nil,
                       normalmap: nil,
                       ringmap: "saturnrings.jpg",
                       ring_transparencymap: "saturnringtransparency.jpg",
                       ring_inner_ratio: 1.239,
                       ring_outer_ratio: 2.270)
        
        Saturn.geology(mass: 568340000.zettagram(),
                       volume: 827130000.gigameter(),
                       equatorial: 60268.kilometer(),
                       density: 687.kilogram(),
                       gravity: 10.44.meter(),
                       escape_velocity: 35.5.kilometer(),
                       irradiance: 14.82,
                       geographic_height_variance: nil)
        
        Saturn.orbitals(year_length: 10748.94.day(),
                        perihelion: 1352550000.kilometer(),
                        aphelion: 1514500000.kilometer(),
                        velocity: 9.68.kilometer(),
                        inclination: 2.485,
                        eccentricity: 0.0565,
                        day_length: 10.656.hour(),
                        equator_inclination: 26.73,
                        min_distance_from_earth: 1195500000.kilometer(),
                        max_distance_from_earth: 1658500000.kilometer())
        
        Saturn.atmosphere(surface_pressure: 1000,
                          average_temperature: 134,
                          total_mass: nil)
        
        Saturn.images = [
            ("saturn - backlit.jpg", "Saturn's rings are best visualized with sunlight from behind them."),
            ("saturn - dot.jpg", "Cassini's recreation of the famous \"Pale Blue Dot\" image taken by Voyager.  All of human existence is contained on Earth, the small spec to the right of the middle of the image."),
            ("saturn - hexagon.jpg", "The north pole of Saturn has a hexagonial storm caused by perturbations in the jet stream.  This is a false-color infrared image from Cassini"),
            ("saturn - pole.jpg", "A close up of the eye of the storm at the north pole.  This part of the storm is around the diameter of Earth."),
            ("saturn - quintet.jpg", "Five of Saturn's moons (from left to right: Janus, Pandora, Enceladus, Mimas, and Rhea) pose with its rings."),
            ("saturn - storm.jpg", "The beginning of a massive storm that started in late 2010.  In less than a year, the storm had expanded to encircle the planet."),
            ("saturn - waves.jpg", "Perturbations in Saturns rings caused by a young object forming in the Keeler gap in the rings.")]
        
        Saturn.colors(background: "saturnsurface.jpg",
                      color1: "4F311B",
                      color2: "CEBBA8")
        
        let S1 = Moon(name: "S/2009 S 1",
                      position: 1)
        
        S1.about(description: "S/2009 S 1 is a 'propeller moonlet' of Saturn orbiting at a distance of approximately 117,000 kilometres (73,000 mi), in the outer part of Saturn's B Ring, and with an approximate diameter of 300 meters (980 ft). It was discovered by the Cassini Imaging Team on 26 July 2009. The moonlet was noticed during the 2009 equinox event by an approximately 36-kilometer-long shadow that it cast on Saturn's B ring. S/2009 S 1 protrudes approximately 150 metres (490 ft) above the ring. The image was taken approximately 296,000 kilometres (184,000 mi) from Saturn.",
                 wiki: "https://en.wikipedia.org/wiki/S/2009_S_1",
                 nasa: "http://solarsystem.nasa.gov/planets/s2009s1")
        
        Saturn.moons.append(S1)
        
        let Pan = Moon(name: "Pan",
                       position: 2)
        
        Pan.about(description: "Pan is the second-innermost moon of Saturn. It is a walnut-shaped small moon about 35 kilometres across and 23 km high that orbits within the Encke Gap in Saturn's A Ring. Pan is a ring shepherd and is responsible for keeping the Encke Gap free of ring particles.\n\nIt was discovered by Mark R. Showalter in 1990 from analysis of old Voyager 2 probe photos and received the provisional designation S/1981 S 13 because the discovery images dated back to 1981.",
                  wiki: "https://en.wikipedia.org/wiki/Pan_(moon)",
                  nasa: "http://solarsystem.nasa.gov/planets/pan")
        
        Saturn.moons.append(Pan)
        
        let Daphnis = Moon(name: "Daphnis",
                           position: 3)
        
        Daphnis.about(description: "Daphnis is an inner satellite of Saturn. It is also known as Saturn XXXV; its provisional designation was S/2005 S 1. Daphnis is about 8 kilometres in diameter, and orbits the planet in the Keeler Gap within the A ring.\n\nThe moon was named in 2006 after Daphnis, a shepherd, pipes player, and pastoral poet in Greek mythology; he was descendant of the Titans, after whom the largest moons of Saturn are named. Both Daphnis and Pan, the only other known shepherd moon to orbit within Saturn's main rings, are named for mythological figures associated with shepherds.\n\nDaphnis was discovered by the Cassini Imaging Science Team on May 6, 2005. The discovery images were taken by the Cassini probe over 16 min on May 1, 2005, from a time-lapse sequence of 0.180 second narrow-angle-camera exposures of the outer edge of the A ring. The moon was subsequently found in 32 low-phase images taken of the F ring on April 13, 2005 (spanning 18 min) and again in two high-resolution (3.54 km/pixel) low-phase images taken on May 2, 2005, when its 7 km disk was resolved.",
                      wiki: "https://en.wikipedia.org/wiki/Daphnis_(moon)",
                      nasa: "http://solarsystem.nasa.gov/planets/daphnis")
        
        Saturn.moons.append(Daphnis)
        
        let Atlas = Moon(name: "Atlas",
                         position: 4)
        
        Atlas.about(description: "Atlas is an inner satellite of Saturn.\n\nAtlas was discovered by Richard Terrile in 1980 (some time before November 12) from Voyager photos and was designated S/1980 S 28. In 1983 it was officially named after Atlas of Greek mythology, because it \"holds the rings on its shoulders\" like the Titan Atlas held the sky up above the Earth. It is also designated Saturn XV.\n\nAtlas is the closest satellite to the sharp outer edge of the A ring, and was long thought to be a shepherd satellite for this ring. However, now it is known that the outer edge of the ring is instead maintained by a 7:6 orbital resonance with the larger but more distant moons Janus and Epimetheus. In 2004 a faint, thin ring, temporarily designated R/2004 S 1, was discovered in the Atlantean orbitnHigh-resolution images taken in June 2005 by Cassini revealed Atlas to have a roughly spherical centre surrounded by a large, smooth equatorial ridge. The most likely explanation for this unusual and prominent structure is that ring material swept up by the moon accumulates on the moon, with a strong preference for the equator due to the ring's thinness. In fact, the size of the equatorial ridge is comparable with the expected Roche lobe of the moon. This would mean that for any additional particles impacting the equator, the centrifugal force will nearly overcome Atlas's tiny gravity, and they will likely be lost.\n\nAtlas is significantly perturbed by Prometheus and to a lesser degree by Pandora, leading to excursions in longitude of up to 600 km (~0.25°) away from the precessing Keplerian orbit with a rough period of about 3 years. Because the orbits of Prometheus and Pandora are chaotic, it is suspected that Atlas's may be as well.",
                    wiki: "https://en.wikipedia.org/wiki/Atlas_(moon)",
                    nasa: "http://solarsystem.nasa.gov/planets/atlas")
        
        Saturn.moons.append(Atlas)
        
        let Prometheus = Moon(name: "Prometheus",
                              position: 5)
        
        Prometheus.about(description: "Prometheus is an inner satellite of Saturn. It was discovered in 1980 (some time before October 25) from photos taken by the Voyager 1 probe, and was provisionally designated S/1980 S 27.\n\nIn late 1985 it was officially named after Prometheus, a Titan in Greek mythology. It is also designated Saturn XVI (16).\n\nPrometheus is extremely elongated, measuring approximately 136 km × 79 km × 59 km (85 mi × 49 mi × 37 mi). It has several ridges and valleys and a number of impact craters of about 20 km (12 mi) diameter are visible, but it is less cratered than nearby Pandora, Epimetheus, and Janus. From its very low density and relatively high albedo, it is likely that Prometheus is a very porous icy body. There is a lot of uncertainty in these values, however, and so this remains to be confirmed.",
                         wiki: "https://en.wikipedia.org/wiki/Prometheus_(moon)",
                         nasa: "http://solarsystem.nasa.gov/planets/prometheus")
        
//        Prometheus.display(texture: nil,
//                           model: "prometheus.dae",
//                           normalmap: nil)
        
        Saturn.moons.append(Prometheus)
        
        let Pandora = Moon(name: "Pandora",
                           position: 6)
        
        Pandora.about(description: "Pandora is an inner satellite of Saturn. It was discovered in 1980 from photos taken by the Voyager 1 probe, and was provisionally designated S/1980 S 26. In late 1985 it was officially named after Pandora from Greek mythology. It is also designated as Saturn XVII.\n\nPandora was thought to be an outer shepherd satellite of the F Ring. However, recent studies indicate that it does not play such a role, and that only Prometheus, the inner shepherd, contributes to the confinement of the narrow ring. It is more heavily cratered than nearby Prometheus, and has at least two large craters 30 kilometres (19 mi) in diameter. The majority of craters on Pandora are shallow as a result of being filled with debris. Ridges and grooves are also present on moon's surface.\n\nThe orbit of Pandora appears to be chaotic, as a consequence of a series of four 118:121 mean-motion resonances with Prometheus. The most appreciable changes in their orbits occur approximately every 6.2 years, when the periapsis of Pandora lines up with the apoapsis of Prometheus and the moons approach to within about 1,400 kilometres (870 mi). Pandora also has a 3:2 mean-motion resonance with Mimas.\n\nFrom its very low density and relatively high albedo, it seems likely that Pandora is a very porous icy body. There is a lot of uncertainty in these values, however, so this remains to be confirmed.",
                      wiki: "https://en.wikipedia.org/wiki/Pandora_(moon)",
                      nasa: "http://solarsystem.nasa.gov/planets/pandora")
        
        Saturn.moons.append(Pandora)
        
        let Epimetheus = Moon(name: "Epimetheus",
                              position: 7)
        
        Epimetheus.about(description: "Epimetheus is an inner satellite of Saturn. It is also known as Saturn XI. It is named after the mythological Epimetheus, brother of Prometheus.\n\nEpimetheus occupies essentially the same orbit as the moon Janus. Astronomers assumed that there was only one body in that orbit (they could not believe that two moons could share nearly identical orbits without colliding), and accordingly had difficulty determining their orbital characteristics. Observations were photographic and spaced widely apart in time, so that while the presence of two objects was not obvious, the observations were difficult to reconcile with a reasonable orbit.\n\nAudouin Dollfus observed a moon on 15 December 1966, which he proposed to be named \"Janus\". On 18 December, Richard Walker made a similar observation which is now credited as the discovery of Epimetheus. However, at the time, it was believed that there was only one moon, unofficially known as \"Janus\", in the given orbit.\n\nTwelve years later, in October 1978, Stephen M. Larson and John W. Fountain realised that the 1966 observations were best explained by two distinct objects (Janus and Epimetheus) sharing very similar orbits. This was confirmed in 1980 by Voyager 1, and so Larson and Fountain officially share the discovery of Epimetheus with Walker.\n\nEpimetheus received its name in 1983. The name Janus was approved by the IAU at the same time, although the name had been used informally since Dollfus proposed it shortly after the 1966 discovery.",
                         wiki: "https://en.wikipedia.org/wiki/Epimetheus_(moon)",
                         nasa: "http://solarsystem.nasa.gov/planets/epimetheus")
        
        Saturn.moons.append(Epimetheus)
        
        let Janus = Moon(name: "Janus",
                         position: 7)
        
        Janus.about(description: "Janus is an inner satellite of Saturn. It is also known as Saturn X. It is named after the mythological Janus.\n\nJanus was identified by Audouin Dollfus on 15 December 1966 and given the temporary designation S/1966 S 2. Previously, Jean Texereau had photographed Janus on 29 October 1966 without realising it. On December 18, Richard Walker observed an object in the same orbit as Janus, but whose position could not be reconciled with the previous observations. Twelve years later, in October 1978, Stephen M. Larson and John W. Fountain realised that the 1966 observations were best explained by two distinct objects (Janus and Epimetheus) sharing very similar orbits, Rick Walker is now credited with the discovery of Epimetheus. Voyager 1 confirmed this orbital configuration in 1980.\n\nJanus's orbit is co-orbital with that of Epimetheus. Janus's mean orbital radius from Saturn is, as of 2006 (as shown by green color in the adjacent picture), only 50 km less than that of Epimetheus, a distance smaller than either moon's mean radius. In accordance with Kepler's laws of planetary motion, the closer orbit is completed more quickly. Because of the small difference it is completed in only about 30 seconds less. Each day, the inner moon is an additional 0.25° farther around Saturn than the outer moon. As the inner moon catches up to the outer moon, their mutual gravitational attraction increases the inner moon's momentum and decreases that of the outer moon. This added momentum means that the inner moon's distance from Saturn and orbital period are increased, and the outer moon's are decreased. The timing and magnitude of the momentum exchange is such that the moons effectively swap orbits, never approaching closer than about 10,000 km. At each encounter Janus's orbital radius changes by ~20 km and Epimetheus's by ~80 km: Janus's orbit is less affected because it is four times more massive than Epimetheus. The exchange takes place close to every four years; the last close approaches occurred in January 2006, 2010 and 2014, and the next in 2018. This is the only such orbital configuration known in the Solar System.",
                    wiki: "https://en.wikipedia.org/wiki/Janus_(moon)",
                    nasa: "http://solarsystem.nasa.gov/planets/janus")
        
//        Janus.display(texture: nil,
//                      model: "janus.dae",
//                      normalmap: nil)
        
        Saturn.moons.append(Janus)
        
        let Aegaeon = Moon(name: "Aegaeon",
                           position: 9)
        
        Aegaeon.about(description: "Aegaeon, also Saturn LIII (provisional designation S/2008 S 1), is a natural satellite of Saturn. It is thought to be similarly smooth as Methone. It orbits between Janus and Mimas within Saturn's G Ring.\n\nIt is probably a major source of the ring. Debris knocked off Aegaeon forms a bright arc near the inner edge, which in turn spreads to form the rest of the ring. Aegaeon orbits in a 7:6 corotation eccentricity resonance with Mimas, which causes an approximately 4-year oscillation of about 4 km in its semi-major axis, and a corresponding oscillation of a few degrees in its mean longitude. It orbits Saturn at an average distance of 167,500 km in 0.80812 days, at an inclination of 0.001° to Saturn's equator, with an eccentricity of 0.0002.\n\nAegaeon is the smallest known moon of Saturn and has a highly elongated shape, measuring 1.4x0.5x0.4 km in size. Measurements of its mass, based on its interaction with the dust particles that make up the G ring arc the moon is embedded in, suggest a density similar to that of water ice. Aegaeon has the lowest albedo, below 0.15, of any Saturnian moon inward of Titan. This might be due to either darker meteoric material making up the dust in the G ring or due to Aegaeon having been disrupted, stripping away its ice-rich surface and leaving the rocky inner core behind.",
                      wiki: "https://en.wikipedia.org/wiki/Aegaeon_(moon)",
                      nasa: "http://solarsystem.nasa.gov/planets/aegaeon")
        
        Saturn.moons.append(Aegaeon)
        
        let Mimas = Moon(name: "Mimas",
                         position: 10)
        
        Mimas.about(description: "Mimas is a moon of Saturn which was discovered in 1789 by William Herschel. It is named after Mimas, a son of Gaia in Greek mythology, and is also designated Saturn I.\n\nWith a diameter of 396 kilometres (246 mi) it is the smallest astronomical body that is known to be rounded in shape because of self-gravitation.\n\nThe surface area of Mimas is slightly less than the land area of Spain. The low density of Mimas, 1.15 g/cm3, indicates that it is composed mostly of water ice with only a small amount of rock. Due to the tidal forces acting on it, Mimas is noticeably prolate; its longest axis is about 10% longer than the shortest. The ellipsoidal shape of Mimas is especially noticeable in some recent images from the Cassini probe.\n\nMimas's most distinctive feature is a giant impact crater 130 km (81 mi) across, named Herschel after the discoverer of Mimas. Herschel's diameter is almost a third of Mimas's own diameter; its walls are approximately 5 km (3 mi) high, parts of its floor measure 10 km (6 mi) deep, and its central peak rises 6 km (4 mi) above the crater floor. If there were a crater of an equivalent scale on Earth (in relative size) it would be over 4,000 km (2,500 mi) in diameter, wider than Australia. The impact that made this crater must have nearly shattered Mimas: fractures can be seen on the opposite side of Mimas that may have been created by shock waves from the impact travelling through Mimas's body.\n\nThe Mimantean surface is saturated with smaller impact craters, but no others are anywhere near the size of Herschel. Although Mimas is heavily cratered, the cratering is not uniform. Most of the surface is covered with craters larger than 40 km (25 mi) in diameter, but in the south polar region, there are generally no craters larger than 20 km (12 mi) in diameter.\n\nThree types of geological features are officially recognized on Mimas: craters, chasmata (chasms) and catenae (crater chains).",
                    wiki: "https://en.wikipedia.org/wiki/Mimas_(moon)",
                    nasa: "http://solarsystem.nasa.gov/planets/mimas")
        
        Mimas.display(texture: "mimasmap.jpg",
                      model: nil,
                      normalmap: nil)
        
        Saturn.moons.append(Mimas)
        
        let Methone = Moon(name: "Methone",
                           position: 11)
        
        Methone.about(description: "Methone was first seen by the Cassini Imaging Team and given the temporary designation S/2004 S 1. Methone is also named Saturn XXXII (32). The Cassini spacecraft has made two visits to Methone and its closest approach was made on May 20, 2012 with a minimum distance of 1,900 km (1,181 mi) from it.\n\nThe name Methone was approved by the IAU Working Group on Planetary System Nomenclature on January 21, 2005. It was ratified at the IAU General Assembly in 2006. Methone was one of the Alkyonides, the seven beautiful daughters of the Giant Alkyoneus.\n\nIn May 2012, the Cassini spacecraft obtained its first close-up photographs of Methone, revealing an egg-shaped moonlet with a remarkably smooth surface, with no visible craters. The moons Pallene and Aegaeon are thought to be similarly smooth. Methone has a two different sharply defined albedo regions, one distinctly (~13%) darker centered on Methone's leading point. It brighter area has an albedo of ~0.70. UV and IR spectra gave no indication of a color difference between the two regions, suggesting that a physical rather than compositional difference may be responsible. Increased exposure to electrons from Saturn's magnetosphere has been proposed to be responsible for thermal anomalies on the leading hemispheres of Mimas and Tethys, and a similar irradiation anisotropy might be behind Methone's albedo pattern.",
                      wiki: "https://en.wikipedia.org/wiki/Methone_(moon)",
                      nasa: "http://solarsystem.nasa.gov/planets/methone")
        
        Saturn.moons.append(Methone)
        
        let Anthe = Moon(name: "Anthe",
                         position: 12)
        
        Anthe.about(description: "Anthe is a very small natural satellite of Saturn lying between the orbits of Mimas and Enceladus. It is also known as Saturn XLIX; its provisional designation was S/2007 S 4. It is named after one of the Alkyonides; the name means flowery. It is the sixtieth confirmed moon of Saturn.\n\nIt was discovered by the Cassini Imaging Team in images taken on 30 May 2007. Once the discovery was made, a search of older Cassini images revealed it in observations from as far back as June 2004. It was first announced on 18 July 2007.\n\nAnthe is visibly affected by a perturbing 10:11 mean-longitude resonance with the much larger Mimas. This causes its osculating orbital elements to vary with an amplitude of about 20 km in semi-major axis on a timescale of about 2 Earth years. The close proximity to the orbits of Pallene and Methone suggests that these moons may form a dynamical family.\n\nMaterial blasted off Anthe by micrometeoroid impacts is thought to be the source of the Anthe Ring Arc, a faint partial ring about Saturn co-orbital with the moon first detected in June 2007.",
                    wiki: "https://en.wikipedia.org/wiki/Anthe_(moon)",
                    nasa: "http://solarsystem.nasa.gov/planets/anthe")
        
        Saturn.moons.append(Anthe)
        
        let Pallene = Moon(name: "Pallene",
                           position: 13)
        
        Pallene.about(description: "Pallene is a very small natural satellite of Saturn. It is one of three small moons known as the Alkyonides that lie between the orbits of the larger Mimas and Enceladus. It is also designated as Saturn XXXIII (33).\n\nPallene was discovered by the Cassini Imaging Team in 2004, during the Cassini–Huygens mission. It was given the temporary designation S/2004 S 2. In 2005, the name Pallene was provisionally approved by the IAU Division III Working Group for Planetary System Nomenclature, and was ratified at the IAU General Assembly in 2006. The name refers to Pallene, one of the Alkyonides, the seven beautiful daughters of the giant Alkyoneus.\n\nAfter the discovery in 2004, it was realized that Pallene had been first photographed on August 23, 1981, by the space probe Voyager 2. It had appeared in a single photograph and had been provisionally named S/1981 S 14 and estimated to orbit 200,000 km from Saturn. Because it had not been visible in other images, it had not been possible to compute its orbit at the time, but recent comparisons have shown it to match Pallene's orbit.",
                      wiki: "https://en.wikipedia.org/wiki/Pallene_(moon)",
                      nasa: "http://solarsystem.nasa.gov/planets/pallene")
        
        Saturn.moons.append(Pallene)
        
        let Enceladus = Moon(name: "Enceladus",
                             position: 14)
        
        Enceladus.about(description: "Enceladus is the sixth-largest moon of Saturn. It is about 500 kilometers (310 mi) in diameter, about a tenth of that of Saturn's largest moon, Titan. Enceladus is mostly covered by fresh, clean ice, making it one of the most reflective bodies of the solar system. Consequently, its surface temperature at noon only reaches −198 °C (−324 °F), far colder than a light-absorbing body would be. Despite its small size, Enceladus has a wide range of surface features, ranging from old, heavily cratered regions to young, tectonically deformed terrains that formed as recently as 100 million years ago.\n\nEnceladus was discovered on August 28, 1789, by William Herschel, but little was known about it until the two Voyager spacecraft passed nearby in the early 1980s. In 2005, the Cassini spacecraft started multiple close flybys of Enceladus, revealing its surface and environment in greater detail. In particular, Cassini discovered water-rich plumes venting from the south polar region. Cryovolcanoes near the south pole shoot geyser-like jets of water vapor, other volatiles, and solid material, including sodium chloride crystals and ice particles, into space, totaling about 200 kilograms (440 lb) per second. Over 100 geysers have been identified. Some of the water vapor falls back as \"snow\"; the rest escapes, and supplies most of the material making up Saturn's E ring. According to NASA scientists, the plumes are similar in composition to comets. In 2014, NASA reported that Cassini found evidence for a large south polar subsurface ocean of liquid water with a thickness of around 10 km (6 mi).\n\nThese geyser observations, along with the finding of escaping internal heat and very few (if any) impact craters in the south polar region, show that Enceladus is geologically active today. Like many other satellites in the extensive systems of the giant planets, Enceladus is trapped in an orbital resonance. Its resonance with Dione excites its orbital eccentricity, which is damped by tidal forces, tidally heating its interior, and possibly driving the geological activity.",
                        wiki: "https://en.wikipedia.org/wiki/Enceladus",
                        nasa: "http://solarsystem.nasa.gov/planets/enceladus")
        
        Enceladus.display(texture: "enceladusmap.jpg",
                          model: nil,
                          normalmap: nil)
        
        Saturn.moons.append(Enceladus)
        
        let Tethys = Moon(name: "Tethys",
                          position: 15)
        
        Tethys.about(description: "Tethys (or Saturn III) is a mid-sized moon of Saturn about 1,060 km (660 mi) across. It was discovered by G. D. Cassini in 1684 and is named after the titan Tethys of Greek mythology.\n\nTethys has a low density of 0.98 g/cm3, the lowest of all the major moons in the Solar System, indicating that it is made of water ice with just a small fraction of rock. This is confirmed by the spectroscopy of its surface, which identified water ice as the dominant surface material. A small amount of an unidentified dark material is present as well. The surface of Tethys is very bright, being the second-brightest of the moons of Saturn after Enceladus, and neutral in color.\n\nTethys is heavily cratered and cut by a number of large faults/graben. The largest impact crater, Odysseus, is about 400 km in diameter, whereas the largest graben, Ithaca Chasma, is about 100 km wide and more than 2000 km long. These two largest surface features may be related. A small part of the surface is covered by smooth plains that may be cryovolcanic in origin. Like all other regular moons of Saturn, Tethys formed from the Saturnian sub-nebula—a disk of gas and dust that surrounded Saturn soon after its formation.\n\nTethys has been approached by several space probes including Pioneer 11 (1979), Voyager 1 (1980), Voyager 2 (1981), and multiple times by Cassini since 2004.",
                     wiki: "https://en.wikipedia.org/wiki/Tethys_(moon)",
                     nasa: "http://solarsystem.nasa.gov/planets/tethys")
        
        Tethys.display(texture: "tethysmap.jpg",
                       model: nil,
                       normalmap: nil)
        
        Saturn.moons.append(Tethys)
        
        let Telesto = Moon(name: "Telesto",
                           position: 15)
        
        Telesto.about(description: "Telesto is a moon of Saturn. It was discovered by Smith, Reitsema, Larson and Fountain in 1980 from ground-based observations, and was provisionally designated S/1980 S 13. In the following months, several other apparitions were observed: S/1980 S 24, S/1980 S 33, and S/1981 S 1.\n\nIn 1983 it was officially named after Telesto of Greek mythology. It is also designated as Saturn XIII (13) or Tethys B.\n\nTelesto is co-orbital with Tethys, residing in Tethys' leading Lagrangian point (L4). This relationship was first identified by Seidelmann et al. in 1981. Another moon, Calypso, resides in the other (trailing) Lagrangian point of Tethys, 60 degrees in the other direction from Tethys. The Saturnian system has two additional trojan moons.",
                      wiki: "https://en.wikipedia.org/wiki/Telesto_(moon)",
                      nasa: "http://solarsystem.nasa.gov/planets/telesto")
        
        Saturn.moons.append(Telesto)
        
        let Calypso = Moon(name: "Calypso",
                           position: 15)
        
        Calypso.about(description: "Calypso is a moon of Saturn. It was discovered in 1980, from ground-based observations, by Dan Pascu, P. Kenneth Seidelmann, William A. Baum, and Douglas G. Currie, and was provisionally designated S/1980 S 25 (the 25th satellite of Saturn discovered in 1980). Several other apparitions of it were recorded in the following months: S/1980 S 29, S/1980 S 30, S/1980 S 32, and S/1981 S 2. In 1983 it was officially named after Calypso of Greek mythology. It is also designated as Saturn XIV or Tethys C.\n\nCalypso is co-orbital with the moon Tethys, and resides in Tethys' trailing Lagrangian point (L5), 60 degrees behind Tethys. This relationship was first identified by Seidelmann et al. in 1981. The moon Telesto resides in the other (leading) Lagrangian point of Tethys, 60 degrees in the other direction from Tethys. Calypso and Telesto have been termed \"Tethys trojans\", by analogy to the trojan asteroids, and are half of the four presently known trojan moons.\n\nLike many other small Saturnian moons and small asteroids, Calypso is irregularly shaped, has overlapping large craters, and appears to also have loose surface material capable of smoothing the craters' appearance. Its surface is one of the most reflective (at visual wavelengths) in the Solar System, with a visual geometric albedo of 1.34. This very high albedo is the result of the sandblasting of particles from Saturn's E-ring, a faint ring composed of small, water-ice particles generated by Enceladus' south polar geysers.",
                      wiki: "https://en.wikipedia.org/wiki/Calypso_(moon)",
                      nasa: "http://solarsystem.nasa.gov/planets/calypso")
        
        Saturn.moons.append(Calypso)
        
        let Dione = Moon(name: "Dione",
                         position: 18)
        
        Dione.about(description: "Dione is a moon of Saturn. It was discovered by Italian astronomer Giovanni Domenico Cassini in 1684. It is named after the Titaness Dione of Greek mythology. It is also designated Saturn IV.\n\nGiovanni Domenico Cassini named the four moons he discovered (Tethys, Dione, Rhea and Iapetus) Sidera Lodoicea (\"the stars of Louis\") to honor king Louis XIV. Cassini found Dione in 1684 using a large aerial telescope he set up on the grounds of the Paris Observatory. The satellites of Saturn were not named until 1847, when William Herschel's son John Herschel published Results of Astronomical Observations made at the Cape of Good Hope, suggesting that the names of the Titans (sisters and brothers of Cronus) be used.\n\nAt 1122 km (697 mi) in diameter, Dione is the 15th largest moon in the Solar System, and is more massive than all known moons smaller than itself combined. About two thirds of Dione's mass is water ice, and the remaining is a dense core, probably silicate rock.\n\nData gathered by Cassini indicates that Dione has an internal liquid water ocean (a situation similar to that of its orbital resonance partner, Enceladus). Downward bending of the surface associated with the 1.5 km high ridge Janiculum Dorsa can most easily be explained by the presence of such an ocean. Gravity and shape data points to a 99 ± 23 km thick ice shell crust on top of a 65 ± 30 internal liquid water global ocean. Neither moon has a shape close to hydrostatic equilibrium; the deviations are maintained by isostasy. Dione's ice shell is thought to vary in thickness by less than 5%, with the thinnest areas at the poles, where tidal heating of the crust is greatest.\n\nThough somewhat smaller and denser, Dione is otherwise very similar to Rhea. They both have similar albedo features and varied terrain, and both have dissimilar leading and trailing hemispheres. Dione's leading hemisphere is heavily cratered and is uniformly bright. Its trailing hemisphere, however, contains an unusual and distinctive surface feature: a network of bright ice cliffs.",
                    wiki: "https://en.wikipedia.org/wiki/Dione_(moon)",
                    nasa: "http://solarsystem.nasa.gov/planets/dione")
        
        Dione.display(texture: "dionemap.jpg",
                      model: nil,
                      normalmap: nil)
        
        Saturn.moons.append(Dione)
        
        let Helene = Moon(name: "Helene",
                          position: 18)
        
        Helene.about(description: "Helene is a moon of Saturn. It was discovered by Pierre Laques and Jean Lecacheux in 1980 from ground-based observations at Pic du Midi Observatory, and was designated S/1980 S 6. In 1988 it was officially named after Helen of Troy, who was the granddaughter of Cronus (Saturn) in Greek mythology. Helene is also designated Saturn XII (12), which it was given in 1982, and Dione B, because it is co-orbital with Dione and located in its leading Lagrangian point (L4). It is one of four known trojan moons.\n\nHelene was initially observed from Earth in 1980, and Voyager flybys of Saturn in the early 1980s allowed much closer views. The Cassini–Huygens mission, which went into orbit around Saturn in 2004, provided still better views, and allowed more in-depth analysis of Helene, including views of the surface under different lighting conditions. Some of the closest images of Helene to date are from the Cassini spacecraft's 1800 km flyby on March 3, 2010, and another very successful imaging sequence occurred in June 2011. There have been many other approaches over the course of the Cassini mission, and future flybys may yield additional data.",
                     wiki: "https://en.wikipedia.org/wiki/Helene_(moon)",
                     nasa: "http://solarsystem.nasa.gov/planets/helene")
        
        Saturn.moons.append(Helene)
        
        let Polydeuces = Moon(name: "Polydeuces",
                              position: 18)
        
        Polydeuces.about(description: "Polydeuces, or Saturn XXXIV (34), is a small natural satellite of Saturn that is co-orbital with the moon Dione and librates around its trailing Lagrangian point (L5). Its diameter is estimated to be 2–3 km. Dione's other co-orbital moon is Helene, which is bigger and located at the leading L4 point.\n\nPolydeuces was discovered by the Cassini Imaging Team on October 24, 2004, in images taken on October 21, 2004, and given the temporary designation S/2004 S 5. Subsequent searches of earlier Cassini imaging showed it in images as far back as April 9, 2004. Of the four known Lagrangian co-orbitals in the Saturn system ('trojan moon'), Polydeuces wanders the farthest from its Lagrangian point: its distance behind Dione varies from 33.9° to 91.4° with a period of 790.931 days (for comparison, L5 trails Dione by 60°). Polydeuces's libration is large enough that it takes on some qualities of a tadpole orbit, as evidenced by the clear asymmetry between excursions towards and away from Dione. In the course of one such cycle, Polydeuces's orbital radius also varies by about ± 7660 km with respect to Dione's.\n\nThe name Polydeuces was approved by the IAU Working Group on Planetary System Nomenclature on January 21, 2005. In Greek mythology, Polydeuces is another name for Pollux, twin brother of Castor, son of Zeus and Leda.\n\nDue to gravitational interactions with Dione, its surface may be in hydrostatic equilibrium but not its interior, similar to Methone being in hydrostatic equilibrium due to interactions with Mimas.",
                         wiki: "https://en.wikipedia.org/wiki/Polydeuces_(moon)",
                         nasa: "http://solarsystem.nasa.gov/planets/polydeuces")
        
        Saturn.moons.append(Polydeuces)
        
        let Rhea = Moon(name: "Rhea",
                        position: 21)
        
        Rhea.about(description: "Rhea is the second-largest moon of Saturn and the ninth-largest moon in the Solar System. It is the second smallest body in the Solar System, after the asteroid and dwarf planet Ceres, for which precise measurements have confirmed a shape consistent with hydrostatic equilibrium. It was discovered in 1672 by Giovanni Domenico Cassini.\n\nRhea was discovered by Giovanni Domenico Cassini on 23 December 1672. It was the third moon discovered around Saturn and the second by him.\n\nRhea is named after the Titan Rhea of Greek mythology, the \"mother of the gods\". It is also designated Saturn V (being the fifth major moon going outward from the planet).\n\nRhea is an icy body with a density of about 1.236 g/cm3. This low density indicates that it is made of ~25% rock (density ~3.25 g/cm3) and ~75% water ice (density ~0.93 g/cm3). Although Rhea is the ninth-largest moon, it is only the tenth-most-massive moon.\n\nEarlier it was assumed that Rhea had a rocky core in the center. However measurements taken during a close flyby by the Cassini orbiter in 2005 cast this into doubt. In a paper published in 2007 it was claimed that the axial dimensionless moment of inertia coefficient was 0.4. Such a value indicated that Rhea had an almost homogeneous interior (with some compression of ice in the center) while the existence of a rocky core would imply a moment of inertia of about 0.34. In the same year another paper claimed the moment of inertia was about 0.37 implying that Rhea was partially differentiated. A year later yet another paper claimed that the moon may not be in hydrostatic equilibrium meaning that the moment of inertia can not be determined from the gravity data alone. In 2008 an author of the first paper tried to reconcile these three disparate results. He concluded that there is a systematic error in the Cassini radio Doppler data used in the analysis, but after restricting the analysis to a subset of data obtained closest to the moon, he arrived at his old result that Rhea was in hydrostatic equilibrium and had the moment inertia of about 0.4, again implying a homogeneous interior.",
                   wiki: "https://en.wikipedia.org/wiki/Rhea_(moon)",
                   nasa: "http://solarsystem.nasa.gov/planets/rhea")
        
        Rhea.display(texture: "rheamap.jpg",
                     model: nil,
                     normalmap: nil)
        
        Saturn.moons.append(Rhea)
        
        let Titan = Moon(name: "Titan",
                         position: 22)
        
        Titan.about(description: "Titan is the largest moon of Saturn. It is the only moon known to have a dense atmosphere, and the only object in space other than Earth where clear evidence of stable bodies of surface liquid has been found.\n\nTitan is the sixth ellipsoidal moon from Saturn. Frequently described as a planet-like moon, Titan is 50% larger than Earth's Moon, and it is 80% more massive. It is the second-largest moon in the Solar System, after Jupiter's moon Ganymede, and is larger than the smallest planet, Mercury, but only 40% as massive. Discovered in 1655 by the Dutch astronomer Christiaan Huygens, Titan was the first known moon of Saturn, and the sixth known planetary satellite. Titan orbits Saturn at 20 Saturn radii. From Titan's surface Saturn subtends an arc of 5.7 degrees and would appear 11.4 times larger in the sky than the Moon from Earth.\n\nTitan is primarily composed of water ice and rocky material. Much as with Venus before the Space Age, the dense opaque atmosphere prevented understanding of Titan's surface until new information from the Cassini–Huygens mission in 2004, including the discovery of liquid hydrocarbon lakes in Titan's polar regions. The geologically young surface is generally smooth, with few impact craters, although mountains and several possible cryovolcanoes have been found.\n\nThe atmosphere of Titan is largely nitrogen; minor components lead to the formation of methane and ethane clouds and nitrogen-rich organic smog. The climate—including wind and rain—creates surface features similar to those of Earth, such as dunes, rivers, lakes, seas (probably of liquid methane and ethane), and deltas, and is dominated by seasonal weather patterns as on Earth. With its liquids (both surface and subsurface) and robust nitrogen atmosphere, Titan's methane cycle is analogous to Earth's water cycle, at the much lower temperature of about 94 K (−179.2 °C).",
                    wiki: "https://en.wikipedia.org/wiki/Titan_(moon)",
                    nasa: "http://solarsystem.nasa.gov/planets/titan")
        
        Titan.display(texture: "titanmap.jpg",
                      model: nil,
                      normalmap: nil)
        
        Saturn.moons.append(Titan)
        
        let Hyperion = Moon(name: "Hyperion",
                            position: 23)
        
        Hyperion.about(description: "Hyperion, also known as Saturn VII (7), is a moon of Saturn discovered by William Cranch Bond, George Phillips Bond and William Lassell in 1848. It is distinguished by its irregular shape, its chaotic rotation, and its unexplained sponge-like appearance. It was the first non-round moon to be discovered.\n\nThe moon is named after Hyperion, the Titan god of watchfulness and observation – the elder brother of Cronus, the Greek equivalent of Saturn – in Greek mythology. It is also designated Saturn VII. The adjectival form of the name is Hyperionian.\n\nHyperion's discovery came shortly after John Herschel had suggested names for the seven previously-known satellites of Saturn in his 1847 publication Results of Astronomical Observations made at the Cape of Good Hope. William Lassell, who saw Hyperion two days after William Bond, had already endorsed Herschel's naming scheme and suggested the name Hyperion in accordance with it. He also beat Bond to publication.\n\nHyperion is one of the largest bodies known to be highly irregularly shaped (non-ellipsoidal, i.e. not in hydrostatic equilibrium) in the Solar System. The only larger moon known to be irregular in shape is Neptune's moon Proteus. Hyperion has about 15% of the mass of Mimas, the least massive known ellipsoidal body. The largest crater on Hyperion is approximately 121.57 km (75.54 mi) in diameter and 10.2 km (6.3 mi) deep. A possible explanation for the irregular shape is that Hyperion is a fragment of a larger body that was broken up by a large impact in the distant past. A proto-Hyperion could have been 350–1,000 km (220–620 mi) in diameter. Over about 1,000 years, ejecta from a presumed Hyperion breakup would have impacted Titan at low speeds, building up volatiles in the atmosphere of Titan.\n\nLike most of Saturn's moons, Hyperion's low density indicates that it is composed largely of water ice with only a small amount of rock. It is thought that Hyperion may be similar to a loosely accreted pile of rubble in its physical composition. However, unlike most of Saturn's moons, Hyperion has a low albedo (0.2–0.3), indicating that it is covered by at least a thin layer of dark material. This may be material from Phoebe (which is much darker) that got past Iapetus. Hyperion is redder than Phoebe and closely matches the color of the dark material on Iapetus.",
                       wiki: "https://en.wikipedia.org/wiki/Hyperion_(moon)",
                       nasa: "http://solarsystem.nasa.gov/planets/hyperion")
        
//        Hyperion.display(texture: nil,
//                         model: "hyperion.dae",
//                         normalmap: nil)
        
        Saturn.moons.append(Hyperion)
        
        let Iapetus = Moon(name: "Iapetus",
                           position: 24)
        
        Iapetus.about(description: "Iapetus, or occasionally Japetus, is the third-largest natural satellite of Saturn, eleventh-largest in the Solar System, and the largest body in the Solar System known not to be in hydrostatic equilibrium. Iapetus is best known for its dramatic \"two-tone\" coloration. Discoveries by the Cassini mission in 2007 revealed several other unusual features, such as a massive equatorial ridge running three-quarters of the way around the moon.\n\nIapetus was discovered by Giovanni Domenico Cassini, an Italian astronomer, in October 1671. He had discovered it on the western side of Saturn and tried viewing it on the eastern side some months later, but was unsuccessful. This was also the case the following year, when he was again able to observe it on the western side, but not the eastern side. Cassini finally observed Iapetus on the eastern side in 1705 with the help of an improved telescope, finding it two magnitudes dimmer on that side.\n\nCassini correctly surmised that Iapetus has a bright hemisphere and a dark hemisphere, and that it is tidally locked, always keeping the same face towards Saturn. This means that the bright hemisphere is visible from Earth when Iapetus is on the western side of Saturn, and that the dark hemisphere is visible when Iapetus is on the eastern side. The dark hemisphere was later named Cassini Regio in his honour.\n\nThe orbit of Iapetus is somewhat unusual. Although it is Saturn's third-largest moon, it orbits much farther from Saturn than the next closest major moon, Titan. It has also the most inclined orbital plane of the regular satellites; only the irregular outer satellites like Phoebe have more inclined orbits. The cause of this is unknown.\n\nBecause of this distant, inclined orbit, Iapetus is the only large moon from which the rings of Saturn would be clearly visible; from the other inner moons, the rings would be edge-on and difficult to see. From Iapetus, Saturn would appear to be 1°56' in diameter (four times the size of the Moon viewed from Earth).",
                      wiki: "https://en.wikipedia.org/wiki/Iapetus_(moon)",
                      nasa: "http://solarsystem.nasa.gov/planets/iapetus")
        
        Iapetus.display(texture: "iapetusmap.jpg",
                        model: nil,
                        normalmap: nil)
        
        Saturn.moons.append(Iapetus)
        
        let Kiviuq = Moon(name: "Kiviuq",
                          position: 25)
        
        Kiviuq.about(description: "Kiviuq is a prograde irregular satellite of Saturn. It was discovered by Brett J. Gladman in 2000, and given the temporary designation S/2000 S 5. It was named after Kiviuq, a hero of Inuit mythology.\n\nKiviuq is about 16 kilometres in diameter, and orbits Saturn at an average distance of 11.1 million kilometers in 450 days. It is a member of the Inuit group of irregular satellites. It is light red, and the Kiviupian (Kiviuqan) infrared spectrum is very similar to the Inuit-group satellites Siarnaq and Paaliaq, supporting the thesis of a possible common origin of the Inuit group in the break-up of a larger body.\n\nKiviuq is believed to be in Kozai resonance, cyclically reducing its orbital inclination while increasing the eccentricity and vice versa.",
                     wiki: "https://en.wikipedia.org/wiki/Kiviuq_(moon)",
                     nasa: "http://solarsystem.nasa.gov/planets/kiviuq")
        
        Saturn.moons.append(Kiviuq)
        
        let Ijiraq = Moon(name: "Ijiraq",
                          position: 26)
        
        Ijiraq.about(description: "Ijiraq, or Saturn XXII (22), is small prograde irregular satellite of Saturn. It was discovered by the team of Brett Gladman, John J. Kavelaars, et al. in 2000, and given the temporary designation S/2000 S 6. It was named in 2003 after the ijiraq, a creature in Inuit mythology.\n\nAnimated discovery image of Ijiraq While Ijiraq is a member of the Inuit group of irregular satellites, recent observations revealed that it is distinctively redder than Paaliaq, Siarnaq and Kiviuq. Its spectral slope (a measure of body reflectance in function of the wavelength) is twice as steep as that of other Inuit-group satellites (20% per 100 nm), typical for red trans-Neptunian objects like Sedna but unknown for irregular satellites. In addition, the Ijiraupian (Ijiraqan) spectrum lacks the weak absorption near 0.7 μm, attributed to a possible water hydration, found in the other three.",
                     wiki: "https://en.wikipedia.org/wiki/Ijiraq_(moon)",
                     nasa: "http://solarsystem.nasa.gov/planets/ijiraq")
        
        Saturn.moons.append(Ijiraq)
        
        let Phoebe = Moon(name: "Phoebe",
                          position: 27)
        
        Phoebe.about(description: "Phoebe is an irregular satellite of Saturn with a mean diameter of 213 km. It was discovered by William Henry Pickering on 17 March 1899 from photographic plates that had been taken starting on 16 August 1898 at the Boyden Observatory near Arequipa, Peru, by DeLisle Stewart. It was the first satellite to be discovered photographically.\n\nPhoebe was the first target encountered upon the arrival of the Cassini spacecraft in the Saturn system in 2004, and is thus unusually well-studied for an irregular satellite of its size. Cassini's trajectory to Saturn and time of arrival were specifically chosen to permit this flyby. After the encounter and its insertion into orbit, Cassini did not go much beyond the orbit of Iapetus.\n\nPhoebe is roughly spherical and has a differentiated interior. It was spherical and hot early in its history and was battered out of roundness by repeated impacts. It is thought to be a captured planetesimal from the Kuiper belt.",
                     wiki: "https://en.wikipedia.org/wiki/Phoebe_(moon)",
                     nasa: "http://solarsystem.nasa.gov/planets/phoebe")
        
        Phoebe.display(texture: "phoebemap.jpg",
                       model: nil,
                       normalmap: nil)
        
        Saturn.moons.append(Phoebe)
        
        let Paaliaq = Moon(name: "Paaliaq",
                           position: 28)
        
        Paaliaq.about(description: "Paaliaq is a prograde irregular satellite of Saturn. It was discovered by Brett J. Gladman, John J. Kavelaars, Jean-Marc Petit, Hans Scholl, Matthew J. Holman, Brian G. Marsden, Philip D. Nicholson and Joseph A. Burns in early October 2000, and given the temporary designation S/2000 S 2. It was named in August 2003 after a fictional shaman in the book The Curse of the Shaman, written by Michael Kusugak, who supplied Kavelaars with the names of giants from Inuit mythology that were used for other Saturnian moons.\n\nPaaliaq is thought to be about 22 kilometres in diameter, and orbits Saturn at an average distance of 15.2 million km in 687 days. It is a member of the Inuit group of irregular satellites. It also has a proximity with 9 other moons reaching up to ten miles from each.\n\nIt is light red in color, and in the infrared the Paaliapian (Paaliaqan) spectrum is very similar to the Inuit-group satellites Kiviuq and Siarnaq, supporting the thesis of a possible common origin of the Inuit group in the break-up of a larger body.",
                      wiki: "https://en.wikipedia.org/wiki/Paaliaq",
                      nasa: "http://solarsystem.nasa.gov/planets/paaliaq")
        
        Saturn.moons.append(Paaliaq)
        
        let Skathi = Moon(name: "Skathi",
                          position: 29)
        
        Skathi.about(description: "Skathi, or Saturn XXVII, is a natural satellite of Saturn. It was discovered by Brett Gladman, Kavelaars and colleagues in 2000, and given the temporary designation S/2000 S 8. Skathi is about 8 kilometres in diameter and orbits Saturn at an average distance of 15.576 Gm in 725.784 days, at an inclination of 149° to the ecliptic (150° to Saturn's equator), in a retrograde direction and with an eccentricity of 0.246.\n\nThe name is given as Skadi by most sources. This is the name that was originally announced in 2003; however, the IAU Working Group on Planetary System Nomenclature (WGPSN) decided in early 2005 to use an alternative transliteration of the Norse spelling. The classical spelling is Skaði, with the letter Ð (eth), and the original form Skadi was a graphic approximation of that.\n\nSkathi may have been formed from debris knocked off Phoebe by large impacts at some point in the Solar System's history.\n\nIts name comes from Norse mythology, where Skaði is a giantess who is the wife of the Vanir god Niord.",
                     wiki: "https://en.wikipedia.org/wiki/Skathi_(moon)",
                     nasa: "http://solarsystem.nasa.gov/planets/skathi")
        
        Saturn.moons.append(Skathi)
        
        let Albiorix = Moon(name: "Albiorix",
                            position: 30)
        
        Albiorix.about(description: "Albiorix is a prograde irregular satellite of Saturn. It was discovered by Holman and colleagues in 2000, and given the temporary designation S/2000 S 11.\n\nAlbiorix is the largest member of the Gallic group of irregular satellites.\n\nIt was named in August 2003 for Albiorix, \"a Gallic giant who was considered to be the king of the world.\" The name is known from an inscription found near the French town of Sablet which identifies him with the Roman god Mars (an interpretatio romana).\n\nAlbiorix orbits Saturn at a distance of about 16 million km and its diameter is estimated at 32 kilometers, assuming an albedo of 0.04. The rotation period was measured by the ISS camera of the Cassini spacecraft to 13 hours and 19 minutes.\n\nThe diagram illustrates the Albiorigian orbit in relation to other prograde irregular satellites of Saturn. The eccentricity of the orbits is represented by the yellow segments extending from the pericentre to the apocentre.\n\nGiven the similarity of the orbital elements and the homogeneity of the physical characteristics with other members of the Gallic group, it was suggested that these satellites could have a common origin in the break-up of a larger moon.\n\nVarying colours revealed recently suggest a possibility of a large crater, leading to an alternative hypothesis that Erriapus and Tarvos could be fragments of Albiorix following a near-break-up collision with another body.",
                       wiki: "https://en.wikipedia.org/wiki/Albiorix_(moon)",
                       nasa: "http://solarsystem.nasa.gov/planets/albiorix")
        
        Saturn.moons.append(Albiorix)
        
        let S2 = Moon(name: "S/2007 S 2",
                      position: 31)
        
        S2.about(description: "S/2007 S 2 also known as \"Alejandra\" is a natural satellite of Saturn. Its discovery was announced by Scott S. Sheppard, David C. Jewitt, Jan Kleyna, and Brian G. Marsden on May 1, 2007, from observations taken between January 18 and April 19, 2007. S/2007 S 2 is about 6 kilometres in diameter, and orbits Saturn at an average distance of 16,560,000 kilometres in 792.96 days, at an inclination of 176.68° to the ecliptic, in a retrograde direction and with an eccentricity of 0.218.",
                 wiki: "https://en.wikipedia.org/wiki/S/2007_S_2",
                 nasa: "http://solarsystem.nasa.gov/planets/s02007s2")
        
        Saturn.moons.append(S2)
        
        let Bebhionn = Moon(name: "Bebhionn",
                            position: 32)
        
        Bebhionn.about(description: "Bebhionn or Saturn XXXVII (37) (provisional designation S/2004 S 11) is a natural satellite of Saturn. Its discovery was announced by Scott S. Sheppard, David C. Jewitt, Jan Kleyna, and Brian G. Marsden on 4 May 2005 from observations taken between 12 December 2004 and 9 March 2005.\n\nBebhionn is about 6 kilometres in diameter and orbits Saturn at an average distance of 16,898 Mm in 820.130 days at an inclination of 41° to the ecliptic (18° to Saturn's equator) and with an eccentricity of 0.333. The rotation period was measured by the ISS camera of the Cassini spacecraft to ~16 hours.\n\nIt was named in April 2007 after Bébinn, an early Irish mythology goddess of birth, who was renowned for her beauty.",
                       wiki: "https://en.wikipedia.org/wiki/Bebhionn_(moon)",
                       nasa: "http://solarsystem.nasa.gov/planets/bebhionn")
        
        Saturn.moons.append(Bebhionn)
        
        let Erriapus = Moon(name: "Erriapus",
                            position: 33)
        
        Erriapus.about(description: "Erriapus, also Saturn XXVIII (28), is a prograde irregular satellite of Saturn. It was discovered by Brett Gladman, John J. Kavelaars and colleagues in 2000, and given the temporary designation S/2000 S 10. It was named Erriapo in August 2003 after Erriapus, a giant in Gaulish mythology; the name was changed from dative Erriapo to nominative Erriapus per IAU conventions in late 2007.\n\nErriapus is about 10 kilometres in diameter, and orbits Saturn at an average distance of 17,3 Gm in 871 days.\n\nMember of the Gallic group of irregular satellites, sharing a similar orbit and displaying a similar light-red colour, Erriapus is thought to have its origin in a break-up of a common progenitor of the group or to be a fragment of Albiorix.",
                       wiki: "https://en.wikipedia.org/wiki/Erriapus",
                       nasa: "http://solarsystem.nasa.gov/planets/erriapus")
        
        Saturn.moons.append(Erriapus)
        
        let Skoll = Moon(name: "Skoll",
                         position: 34)
        
        Skoll.about(description: "Skoll or Saturn XLVII (provisional designation S/2006 S 8) is a retrograde irregular satellite of Saturn. Its discovery was announced by Scott S. Sheppard, David C. Jewitt and Jan Kleyna on 26 June 2006 from observations taken between 5 January and 30 April 2006.\n\nSkoll is about 6 kilometres in diameter (assuming an albedo of 0.04) and orbits Saturn at an average distance of 17.6 Gm (million km) in 869 days, following a highly eccentric and moderately inclined orbit.\n\nIt was named in April 2007 after Sköll, a giant wolf from Norse mythology, son of Fenrisulfr and twin brother of Hati.",
                    wiki: "https://en.wikipedia.org/wiki/Skoll_(moon)",
                    nasa: "http://solarsystem.nasa.gov/planets/skoll")
        
        Saturn.moons.append(Skoll)
        
        let Siarnaq = Moon(name: "Siarnaq",
                           position: 35)
        
        Siarnaq.about(description: "Siarnaq, or Saturn XXIX, is a prograde irregular satellite of Saturn. It was discovered by Brett J. Gladman, et al. in 2000, and given the temporary designation S/2000 S 3. Named after the giant Siarnaq of Inuit mythology, it is the largest member of the Inuit group of irregular satellites.\n\nSiarnaq is thought to be about 40 kilometers in diameter. It orbits Saturn at an average distance of 17.5 Gm in 895 days. The rotation period was measured by the Cassini spacecraft to approximately 10 hours and 9 minutes; this is the shortest rotation period of all prograde irregular moons of Saturn.\n\nIt is light red in color, and the Siarnaupian (Siarnaqan) spectrum in the infrared is very similar to the Inuit-group satellites Paaliaq and Kiviuq, supporting the thesis of a possible common origin in the break-up of a larger body.\n\nSiarnaq has been found to be in a secular resonance with Saturn, involving the precession of its periapsis and that of the planet. The studies of these resonances are key to understand the capture mechanism for the irregular satellites and, assuming a common origin of a given dynamical group in the break-up of a single body, to explain today’s dispersion of the orbital elements.",
                      wiki: "https://en.wikipedia.org/wiki/Siarnaq",
                      nasa: "http://solarsystem.nasa.gov/planets/siarnaq")
        
        Saturn.moons.append(Siarnaq)
        
        let Tarqeq = Moon(name: "Tarqeq",
                          position: 36)
        
        Tarqeq.about(description: "Tarqeq, also known as Saturn LII (provisional designation S/2007 S 1) is a natural satellite of Saturn. Its discovery was announced by Scott S. Sheppard, David C. Jewitt, Jan Kleyna, and Brian G. Marsden on 13 April 2007 from observations taken between 5 January 2006 and 22 March 2007. It is named after Tarqeq, the Inuit moon god, and is a member of the Inuit group of irregular satellites. It's about seven kilometres in diameter. The Cassini spacecraft observed Tarqeq over 1.5 days on 15–16 January 2014.\n\nThe Tarqiup (Tarqeqian) orbit lies at an inclination of 49.90° (to the ecliptic; 49.77° to Saturn's equator), with an eccentricity of 0.1081 and a semi-major axis of 17.9106 Gm. Tarqeq orbits in a prograde direction with a period of 894.86 days.",
                     wiki: "https://en.wikipedia.org/wiki/Tarqeq",
                     nasa: "http://solarsystem.nasa.gov/planets/tarqeq")
        
        Saturn.moons.append(Tarqeq)
        
        let S13 = Moon(name: "S/2004 S 13",
                       position: 37)
        
        S13.about(description: "S/2004 S 13 is a natural satellite of Saturn. Its discovery was announced by Scott S. Sheppard, David C. Jewitt, Jan Kleyna, and Brian G. Marsden on 4 May 2005 from observations taken between 12 December 2004 and 9 March 2005.\n\nS/2004 S 13 is about 6 kilometres in diameter, and orbits Saturn at an average distance of 18,056 Mm in 905.848 days, at an inclination of 167° to the ecliptic (143° to Saturn's equator), in a retrograde direction and with an eccentricity of 0.261.",
                  wiki: "https://en.wikipedia.org/wiki/S/2004_S_13",
                  nasa: "http://solarsystem.nasa.gov/planets/s2004s13")
        
        Saturn.moons.append(S13)
        
        let Greip = Moon(name: "Greip",
                         position: 38)
        
        Greip.about(description: "Greip, or Saturn LI (provisional designation S/2006 S 4), is a natural satellite of Saturn. Its discovery was announced by Scott S. Sheppard, David C. Jewitt, Jan Kleyna, and Brian G. Marsden on 26 June 2006, from observations taken between 5 January and 1 May 2006. Greip is about 6 kilometres in diameter, and orbits Saturn at an average distance of 18,066 Mm in 906.556 days, at an inclination of 172.7° to the ecliptic (159.2° to Saturn's equator), in a retrograde direction and with an eccentricity of 0.3735.\n\nIt is named after Greip, a giantess in Norse mythology.",
                    wiki: "https://en.wikipedia.org/wiki/Greip_(moon)",
                    nasa: "http://solarsystem.nasa.gov/planets/greip")
        
        Saturn.moons.append(Greip)
        
        let Hyrrokkin = Moon(name: "Hyrrokkin",
                             position: 39)
        
        Hyrrokkin.about(description: "Hyrrokkin or Saturn XLIV (provisional designation S/2004 S 19) is a natural satellite of Saturn. Its discovery was announced by Scott S. Sheppard, David C. Jewitt, Jan Kleyna, and Brian G. Marsden on June 26, 2006, from observations taken between December 12, 2004, and April 30, 2006.\n\nHyrrokkin is about 8 kilometres in diameter, and orbits Saturn at an average distance of 18,168 Mm in 914 days, at an inclination of 153° to the ecliptic (154° to Saturn's equator), in a retrograde direction and with an eccentricity of 0.36. During four observations in March 2013, the synodic rotational period was measured by the Cassini spacecraft to approximately 12 hours and 45 minutes.\n\nIt was named in April 2007 after Hyrrokkin, a giantess from Norse mythology, who launched Hringhorni, Baldr's funeral ship. It was originally listed as being spelled Hyrokkin, but the spelling was later corrected.",
                        wiki: "https://en.wikipedia.org/wiki/Hyrrokkin_(moon)",
                        nasa: "http://solarsystem.nasa.gov/planets/hyrrokkin")
        
        Saturn.moons.append(Hyrrokkin)
        
        let Jarnsaxa = Moon(name: "Jarnsaxa",
                            position: 40)
        
        Jarnsaxa.about(description: "Jarnsaxa, also known as Saturn L (provisional designation S/2006 S 6), is a natural satellite of Saturn. Its discovery was announced by Scott S. Sheppard, David C. Jewitt, Jan Kleyna, and Brian G. Marsden on June 26, 2006, from observations taken between January 5 and April 29, 2006.\n\nJarnsaxa is about 6 kilometres in diameter, and orbits Saturn at an average distance of 18,556.9 Mm in 943.784 days, at an inclination of 162.9° to the ecliptic (164.1° to Saturn's equator), in a retrograde direction and with an eccentricity of 0.1918. It is a member of the Norse group of irregular satellites.\n\nIt is named after Járnsaxa, a giantess in Norse mythology.",
                       wiki: "https://en.wikipedia.org/wiki/Jarnsaxa_(moon)",
                       nasa: "http://solarsystem.nasa.gov/planets/jarnsaxa")
        
        Saturn.moons.append(Jarnsaxa)
        
        let Tarvos = Moon(name: "Tarvos",
                          position: 41)
        
        Tarvos.about(description: "Tarvos, or Saturn XXI, is a prograde irregular satellite of Saturn. It was discovered by John J. Kavelaars et al. on September 23, 2000, and given the temporary designation S/2000 S 4. The name, given in August 2003, is after Tarvos, a deity depicted as a bull god carrying three cranes alongside its back from Gaulish mythology.\n\nTarvos orbits Saturn at an average distance of 18 million km in 926 days and is about 15 km in diameter (assuming an albedo of 0.04). It has the most eccentric orbit around Saturn.\n\nIt is a member of the Gallic group of irregular satellites.\n\nWith a similar orbit and displaying a similar light-red colour, Tarvos is thought to have its origin in the break-up of a common progenitor or to be a fragment of Albiorix.",
                     wiki: "https://en.wikipedia.org/wiki/Tarvos_(moon)",
                     nasa: "http://solarsystem.nasa.gov/planets/tarvos")
        
        Saturn.moons.append(Tarvos)
        
        let Mundilfari = Moon(name: "Mundilfari",
                              position: 42)
        
        Mundilfari.about(description: "Mundilfari, or Saturn XXV (25), is a natural satellite of Saturn. It was discovered by Brett J. Gladman, et al. in 2000, and given the temporary designation S/2000 S 9. Mundilfari is about 7 kilometres in diameter, and orbits Saturn at an average distance of 18,360 Mm in 928.806 days, at an inclination of 170° to the ecliptic (150° to Saturn's equator), in a retrograde direction and with an eccentricity of 0.198.\n\nMundilfari may have formed from debris knocked off Phoebe by large impacts at some point in the Solar System's history.\n\nIt was named in August 2003 from Norse mythology, where Mundilfari is the father of the goddess Sól and the god Mani.",
                         wiki: "https://en.wikipedia.org/wiki/Mundilfari_(moon)",
                         nasa: "http://solarsystem.nasa.gov/planets/mundilfari")
        
        Saturn.moons.append(Mundilfari)
        
        let S1_2006 = Moon(name: "S/2006 S 1",
                           position: 43)
        
        S1_2006.about(description: "S/2006 S 1 is a natural satellite of Saturn. Its discovery was announced by Scott S. Sheppard, David C. Jewitt, Jan Kleyna, and Brian G. Marsden on June 26, 2006 from observations taken between January 4 and April 30, 2006. S/2006 S 1 is about 6 kilometres in diameter, and orbits Saturn at an average distance of 18,930.2 Mm in 972.407 days, at an inclination of 154.2° to the ecliptic (175.4° to Saturn's equator), in a retrograde direction and with an eccentricity of 0.1303.",
                      wiki: "https://en.wikipedia.org/wiki/S/2006_S_1",
                      nasa: "http://solarsystem.nasa.gov/planets/s2006s01")
        
        Saturn.moons.append(S1_2006)
        
        let S17 = Moon(name: "S/2004 S 17",
                       position: 44)
        
        S17.about(description: "S/2004 S 17 is a natural satellite of Saturn. Its discovery was announced by Scott S. Sheppard, David C. Jewitt, Jan Kleyna, and Brian G. Marsden on May 4, 2005 from observations taken between December 13, 2004 and March 5, 2005. S/2004 S 17 is about 4 kilometres in diameter, and orbits Saturn at an average distance of 19,099 Mm in 985.453 days, at an inclination of 167° to the ecliptic (162° to Saturn's equator), in a retrograde direction and with an eccentricity of 0.226.",
                  wiki: "https://en.wikipedia.org/wiki/S/2004_S_17",
                  nasa: "http://solarsystem.nasa.gov/planets/s2004s17")
        
        Saturn.moons.append(S17)
        
        let Bergelmir = Moon(name: "Bergelmir",
                             position: 45)
        
        Bergelmir.about(description: "Bergelmir or Saturn XXXVIII (38) (provisional designation S/2004 S 15) is a natural satellite of Saturn. Its discovery was announced by Scott S. Sheppard, David C. Jewitt, Jan Kleyna, and Brian G. Marsden on May 4, 2005, from observations taken between December 12, 2004, and March 9, 2005.\n\nBergelmir is about 6 kilometres in diameter, and orbits Saturn at an average distance of 19,372 Mm in 1006.659 days, at an inclination of 157° to the ecliptic (134° to Saturn's equator), in a retrograde direction and with an eccentricity of 0.152.\n\nIt was named in April 2007 after Bergelmir, a giant from Norse mythology and the grandson of Ymir, the primordial giant. Bergelmir and his wife alone among their kind were the only survivors of the enormous deluge of blood from Ymir's wounds when he was killed by Odin and his brothers at the dawn of time. Bergelmir then became the progenitor of a new race of giants.",
                        wiki: "https://en.wikipedia.org/wiki/Bergelmir_(moon)",
                        nasa: "http://solarsystem.nasa.gov/planets/bergelmir")
        
        Saturn.moons.append(Bergelmir)
        
        let Narvi = Moon(name: "Narvi",
                         position: 46)
        
        Narvi.about(description: "Narvi, or Saturn XXXI (31), is a natural satellite of Saturn. It was discovered by a team of astronomers led by Scott S. Sheppard in 2003, and given the temporary designation S/2003 S 1.\n\nNarvi is about 7 kilometres in diameter, and orbits Saturn at an average distance of 19,371,000 km in 1006.541 days, at an inclination of 137° to the ecliptic (109° to Saturn's equator), in a retrograde direction and with an eccentricity of 0.320.\n\nIt was named in January 2005 after Narfi, a giant in Norse mythology. The name was approved by the IAU Working Group on Planetary System Nomenclature on 21 January 2005.",
                    wiki: "https://en.wikipedia.org/wiki/Narvi_(moon)",
                    nasa: "http://solarsystem.nasa.gov/planets/narvi")
        
        Saturn.moons.append(Narvi)
        
        let Suttungr = Moon(name: "Suttungr",
                            position: 47)
        
        Suttungr.about(description: "Suttungr, or Saturn XXIII, is a natural satellite of Saturn. It was discovered by Brett J. Gladman, et al. in 2000, and given the temporary designation S/2000 S 12. It was named for Suttungr in Norse mythology, a Jötunn or giant who once owned the mead of poetry.\n\nSuttungr is about 7 kilometres in diameter, and orbits Saturn at an average distance of 19,667 Mm in 1029.703 days. It may have formed from debris knocked off Phoebe. The Suttungian orbit is retrograde, at an inclination of 174° to the ecliptic (151° to Saturn's equator) and with an eccentricity of 0.131.\n\nIts name was announced as Suttung in IAU Circular 8177. However, the IAU Working Group on Planetary System Nomenclature later decided to add the nominative case ending -r to the base form Suttung.",
                       wiki: "https://en.wikipedia.org/wiki/Suttungr_(moon)",
                       nasa: "http://solarsystem.nasa.gov/planets/suttungr")
        
        Saturn.moons.append(Suttungr)
        
        let Hati = Moon(name: "Hati",
                        position: 48)
        
        Hati.about(description: "Hati or Saturn XLIII (provisional designation S/2004 S 14) is a natural satellite of Saturn. Its discovery was announced by Scott S. Sheppard, David C. Jewitt, Jan Kleyna, and Brian G. Marsden on 4 May 2005, from observations taken between 12 December 2004 and 11 March 2005.\n\nHati is about 6 kilometers in diameter, and orbits Saturn at an average distance of 20,303 Mm in 1080 days, at an inclination of 163° to the ecliptic (165° to Saturn's equator), in a retrograde direction and with an eccentricity of 0.291. In March 2013, the synodic rotational period was measured by Cassini to about 5.5 hours. This is the fastest known rotation of all of Saturn's moons.\n\nIt was named in April 2007 after Hati, a giant wolf from Norse mythology, son of Fenrisúlfr and twin brother of Sköll.",
                   wiki: "https://en.wikipedia.org/wiki/Hati_(moon)",
                   nasa: "http://solarsystem.nasa.gov/planets/hati")
        
        Saturn.moons.append(Hati)
        
        let S12 = Moon(name: "S/2004 S 12",
                       position: 49)
        
        S12.about(description: "S/2004 S 12 is a natural satellite of Saturn. Its discovery was announced by Scott S. Sheppard, David C. Jewitt, Jan Kleyna, and Brian G. Marsden on May 4, 2005 from observations taken between December 12, 2004 and March 9, 2005.\n\nS/2004 S 12 is about 5 kilometres in diameter, and orbits Saturn at an average distance of 19,906 Gm in 1048.541 days, at an inclination of 164° to the ecliptic (162° to Saturn's equator), in a retrograde direction and with an eccentricity of 0.396.",
                  wiki: "https://en.wikipedia.org/wiki/S/2004_S_12",
                  nasa: "http://solarsystem.nasa.gov/planets/s2004s12")
        
        Saturn.moons.append(S12)
        
        let Farbauti = Moon(name: "Farbauti",
                            position: 50)
        
        Farbauti.about(description: "Farbauti or Saturn XL (provisional designation S/2004 S 9) is a natural satellite of Saturn. Its discovery was announced by Scott S. Sheppard, David C. Jewitt, Jan Kleyna, and Brian G. Marsden on May 4, 2005, from observations taken between December 12, 2004, and March 9, 2005.\n\nFarbauti is about 5 kilometres in diameter, and orbits Saturn at an average distance of 20,291 Mm in 1079.099 days, at an inclination of 158° to the ecliptic (131° to Saturn's equator), in a retrograde direction and with an eccentricity of 0.209.\n\nIt was named in April 2007 after Fárbauti, a storm giant from Norse mythology, father of Loki.",
                       wiki: "https://en.wikipedia.org/wiki/Farbauti_(moon)",
                       nasa: "http://solarsystem.nasa.gov/planets/farbauti")
        
        Saturn.moons.append(Farbauti)
        
        let Thrymr = Moon(name: "Thrymr",
                          position: 51)
        
        Thrymr.about(description: "Thrymr or Saturn XXX, is a natural satellite of Saturn. It was discovered by Gladman and colleagues in 2000, and given the temporary designation S/2000 S 7. Its name comes from Norse mythology, where Thrymr is a Jotun.\n\nThrymr is about 7 kilometres in diameter, and orbits Saturn at an average distance of 20,810 Mm in 1120.809 days. It may have formed from debris knocked off Phoebe. The Thrymian orbit is retrograde, at an inclination of 175° to the ecliptic (151° to Saturn's equator) and with an eccentricity of 0.453.\n\nIts name was announced as Thrym in IAU Circular 8177. However, the IAU Working Group on Planetary System Nomenclature later decided to add the nominative case ending -r to the root Thrym.",
                     wiki: "https://en.wikipedia.org/wiki/Thrymr_(moon)",
                     nasa: "http://solarsystem.nasa.gov/planets/thrymr")
        
        Saturn.moons.append(Thrymr)
        
        let Aegir = Moon(name: "Aegir",
                         position: 52)
        
        Aegir.about(description: "Aegir or Saturn XXXVI (provisional designation S/2004 S 10) is a natural satellite of Saturn. Its discovery was announced by Scott S. Sheppard, David C. Jewitt, Jan Kleyna, and Brian G. Marsden on May 4, 2005, from observations taken between December 12, 2004, and March 11, 2005.\n\nAegir is about 6 kilometres in diameter, and orbits Saturn at an average distance of 19,618 Mm in 1025.908 days, at an inclination of 167° to the ecliptic (140° to Saturn's equator), in a retrograde direction and with an eccentricity of 0.237.\n\nIt was named in April 2007 after Ægir, a giant from Norse mythology, the personification of tranquil seas, the one who soothes storms away. He is a son of Fornjót, and brother of Logi (fire, flame) and Kári (wind).",
                    wiki: "https://en.wikipedia.org/wiki/Aegir_(moon)",
                    nasa: "http://solarsystem.nasa.gov/planets/aegir")
        
        Saturn.moons.append(Aegir)
        
        let S3 = Moon(name: "S/2007 S 3",
                      position: 53)
        
        S3.about(description: "S/2007 S 3 is a natural satellite of Saturn. Its discovery was announced by Scott S. Sheppard, David C. Jewitt, Jan Kleyna, and Brian G. Marsden on May 1, 2007 from observations taken between January 18 and April 19, 2007. S/2007 S 3 is about 5 kilometres in diameter, and orbits Saturn at an average distance of 20,518,500 kilometres in about 1100 days, at an inclination of 177.22° to the ecliptic, in a retrograde direction and with an eccentricity of 0.130.",
                 wiki: "https://en.wikipedia.org/wiki/S/2007_S_3",
                 nasa: "http://solarsystem.nasa.gov/planets/s2007s03")
        
        Saturn.moons.append(S3)
        
        let Bestla = Moon(name: "Bestla",
                          position: 54)
        
        Bestla.about(description: "Bestla or Saturn XXXIX (provisional designation S/2004 S 18) is a retrograde irregular moon of Saturn. Its discovery was announced by Scott S. Sheppard, David C. Jewitt, Jan Kleyna, and Brian G. Marsden on 4 May 2005, from observations taken between 13 December 2004 and 5 March 2005.\n\nBestla is about 7 kilometres in diameter, and orbits Saturn at an average distance of 20,192,000 km in 1088 days, at an inclination of 147° to the ecliptic (151° to Saturn's equator), in a retrograde direction and with an eccentricity of 0.5145. Early observations from 2005 suggested that Bestla had a very high eccentricity of 0.77. Like many of the outer irregular moons of the giant planets, Bestla's eccentricity may vary as a result of the Kozai mechanism.\n\nThis moon was named in April 2007 after Bestla, a frost giantess from Norse mythology, who is a mother of Odin.",
                     wiki: "https://en.wikipedia.org/wiki/Bestla_(moon)",
                     nasa: "http://solarsystem.nasa.gov/planets/bestla")
        
        Saturn.moons.append(Bestla)
        
        let S7 = Moon(name: "S/2004 S 7",
                      position: 55)
        
        S7.about(description: "S/2004 S 7 is a natural satellite of Saturn. Its discovery was announced by Scott S. Sheppard, David C. Jewitt, Jan Kleyna, and Brian G. Marsden on May 4, 2005 from observations taken between December 12, 2004 and March 8, 2005.\n\nS/2004 S 7 is about 6 kilometres in diameter, and orbits Saturn at an average distance of 20,999 Mm in 1140.24 days, at an inclination of 166° to the ecliptic (166° to Saturn's equator), in a retrograde direction and with an eccentricity of 0.5299.",
                 wiki: "https://en.wikipedia.org/wiki/S/2004_S_7",
                 nasa: "http://solarsystem.nasa.gov/planets/s2004s07")
        
        Saturn.moons.append(S7)
        
        let S3_2006 = Moon(name: "S/2006 S 3",
                           position: 56)
        
        S3_2006.about(description: "S/2006 S 3 is a natural satellite of Saturn. Its discovery was announced by Scott S. Sheppard, David C. Jewitt, Jan Kleyna, and Brian G. Marsden on June 26, 2006 from observations taken between January and April 2006.\n\nS/2006 S 3 is about 6 kilometres in diameter, and orbits Saturn at an average distance of 21,076.3 Mm in 1142.366 days, at an inclination of 150.8° to the ecliptic (128.8° to Saturn's equator), in a retrograde direction and with an eccentricity of 0.4710.",
                      wiki: "https://en.wikipedia.org/wiki/S/2006_S_3",
                      nasa: "http://solarsystem.nasa.gov/planets/s2006s03")
        
        Saturn.moons.append(S3_2006)
        
        let Fenrir = Moon(name: "Fenrir",
                          position: 57)
        
        Fenrir.about(description: "Fenrir or Saturn XLI (provisional designation S/2004 S 16) is a natural satellite of Saturn. Its discovery was announced by Scott S. Sheppard, David C. Jewitt, Jan Kleyna, and Brian G. Marsden on May 4, 2005, from observations taken between December 13, 2004, and March 5, 2005. Fenrir has an apparent magnitude of 25, making it one of the faintest known moons in the Solar System, and was discovered using some of the largest telescopes in the world. It is even too dark to be observed by the Cassini spacecraft in orbit around Saturn where it never gets brighter than ~17th magnitude. Fenrir was named after Fenrisulfr, a giant wolf from Norse mythology, father of Hati and Skoll, son of Loki, destined to break its bonds for Ragnarök.\n\nFenrir is about 4 kilometres in diameter, and orbits Saturn at an average distance of 22,454 Mm in 1260 days, at an inclination of 163° to the ecliptic (143° to Saturn's equator) with an eccentricity of 0.136. The Fenrian orbit is retrograde: it orbits Saturn in a direction opposite to the planet's spin, suggesting that this irregular moon was captured by Saturn.",
                     wiki: "https://en.wikipedia.org/wiki/Fenrir_(moon)",
                     nasa: "http://solarsystem.nasa.gov/planets/fenrir")
        
        Saturn.moons.append(Fenrir)
        
        let Surtur = Moon(name: "Surtur",
                          position: 58)
        
        Surtur.about(description: "Surtur, or Saturn XLVIII (provisional designation S/2006 S 7), is a natural satellite of Saturn. Its discovery was announced by Scott S. Sheppard, David C. Jewitt, Jan Kleyna, and Brian G. Marsden on June 26, 2006 from observations taken between January and April 2006. It was named after Surtr, a leader of the fire giants of Norse mythology.\n\nSurtur is about 6 kilometres in diameter, and orbits Saturn at an average distance of 22,243.6 Mm in 1238.575 days. The Surtian orbit is retrograde, at an inclination of 166.9° to the ecliptic (148.9° to Saturn's equator) and with an eccentricity of 0.3680.",
                     wiki: "https://en.wikipedia.org/wiki/Surtur_(moon)",
                     nasa: "http://solarsystem.nasa.gov/planets/surtur")
        
        Saturn.moons.append(Surtur)
        
        let Kari = Moon(name: "Kari",
                        position: 59)
        
        Kari.about(description: "Kari, or Saturn XLV (provisional designation S/2006 S 2), is a natural satellite of Saturn. Its discovery was announced by Scott S. Sheppard, David C. Jewitt, Jan Kleyna, and Brian G. Marsden on 26 June 2006 from observations taken between January and April 2006.\n\nKari is about 7 kilometres in diameter, and orbits Saturn at an average distance of 22,305,100 km in 1243.71 days, at an inclination of 148.4° to the ecliptic (151.5° to Saturn's equator), in a retrograde direction and with an eccentricity of 0.3405. The rotation period has been determined to 7 hours and 42 minutes.\n\nIt was named in April 2007 after Kári, son of Fornjót, the personification of wind in Norse mythology.",
                   wiki: "https://en.wikipedia.org/wiki/Kari_(moon)",
                   nasa: "http://solarsystem.nasa.gov/planets/kari")
        
        Saturn.moons.append(Kari)
        
        let Ymir = Moon(name: "Ymir",
                        position: 60)
        
        Ymir.about(description: "Ymir, or Saturn XIX, is a retrograde irregular moon of Saturn. It was discovered by Brett J. Gladman, et al. in 2000, and given the temporary designation S/2000 S 1. It was named in August 2003, from Norse mythology, where Ymir is the ancestor of all the Jotuns or frost giants.\n\nOf the moons that take more than 3 Earth years to orbit Saturn, Ymir is the largest, at about 18 kilometres (11 miles) in diameter. It takes 3.6 Earth years to complete an orbit around Saturn. During this time, hypothetical Ymir visitors would experience ~2650 sunsets.",
                   wiki: "https://en.wikipedia.org/wiki/Ymir_(moon)",
                   nasa: "http://solarsystem.nasa.gov/planets/ymir")
        
        Saturn.moons.append(Ymir)
        
        let Loge = Moon(name: "Loge",
                        position: 61)
        
        Loge.about(description: "Loge, or Saturn XLVI (provisional designation S/2006 S 5), is a natural satellite of Saturn. Its discovery was announced by Scott S. Sheppard, David C. Jewitt, Jan Kleyna, and Brian G. Marsden on 26 June 2006, from observations taken between January and April 2006.\n\nLoge is about 6 kilometres in diameter, and orbits Saturn at an average distance of 23,142.0 Mm in 1314.364 days, at an inclination of 166.5° to the ecliptic (165.3° to Saturn's equator), in a retrograde direction and with an eccentricity of 0.1390.\n\nIt was named in April 2007, after Loge (also spelled Logi), a fire giant from Norse mythology, son of Fornjót, sometimes confused with the god Loki. These two figures were merged into Loge in Richard Wagner's Der Ring des Nibelungen.",
                   wiki: "https://en.wikipedia.org/wiki/Loge_(moon)",
                   nasa: "http://solarsystem.nasa.gov/planets/loge")
        
        Saturn.moons.append(Loge)
        
        let Fornjot = Moon(name: "Fornjot",
                           position: 62)
        
        Fornjot.about(description: "Fornjot, or Saturn XLII (provisional designation S/2004 S 8), is the outermost natural satellite of Saturn. Its discovery was announced by Scott S. Sheppard, David C. Jewitt, Jan Kleyna, and Brian G. Marsden on 4 May 2005 from observations taken between 12 December 2004, and 11 March 2005.\n\nIt is about 6 kilometres in diameter, and it orbits Saturn at an average distance of 23,609 Mm in 1354 d at an inclination of 168° to the ecliptic (160° to Saturn's equator) in a retrograde direction and with an eccentricity of 0.186.\n\nFornjot was named after Fornjót, a giant in Norse mythology.",
                      wiki: "https://en.wikipedia.org/wiki/Fornjot_(moon)",
                      nasa: "http://solarsystem.nasa.gov/planets/fornjot")
        
        Saturn.moons.append(Fornjot)
        
        //----------------------------------------------------------------------------------------------
        let Uranus = Planet(name: "Uranus",
                            type: Type.Ice,
                            position: 7,
                            classification: Class.Major)
        
        Uranus.about(description: "Uranus is the seventh planet from the Sun. It has the third-largest planetary radius and fourth-largest planetary mass in the Solar System. Uranus is similar in composition to Neptune, and both have different bulk chemical composition from that of the larger gas giants Jupiter and Saturn. For this reason, scientists often classify Uranus and Neptune as \"ice giants\" to distinguish them from the gas giants. Uranus's atmosphere is similar to Jupiter's and Saturn's in its primary composition of hydrogen and helium, but it contains more \"ices\" such as water, ammonia, and methane, along with traces of other hydrocarbons. It is the coldest planetary atmosphere in the Solar System, with a minimum temperature of 49 K (−224.2 °C), and has a complex, layered cloud structure with water thought to make up the lowest clouds and methane the uppermost layer of clouds. The interior of Uranus is mainly composed of ices and rock.\n\nUranus is the only planet whose name is derived from a figure from Greek mythology, from the Latinised version of the Greek god of the sky Ouranos. Like the other giant planets, Uranus has a ring system, a magnetosphere, and numerous moons. The Uranian system has a unique configuration among those of the planets because its axis of rotation is tilted sideways, nearly into the plane of its solar orbit. Its north and south poles, therefore, lie where most other planets have their equators. In 1986, images from Voyager 2 showed Uranus as an almost featureless planet in visible light, without the cloud bands or storms associated with the other giant planets. Observations from Earth have shown seasonal change and increased weather activity as Uranus approached its equinox in 2007. Wind speeds can reach 250 metres per second (900 km/h, 560 mph).",
                     wiki: "https://en.wikipedia.org/wiki/Uranus",
                     nasa: "http://solarsystem.nasa.gov/planets/uranus")
        
        Uranus.display(texture: "uranusmap.jpg",
                       model: nil,
                       normalmap: nil,
                       ringmap: "uranusrings.png",
                       ring_transparencymap: "uranusringtransparency.png",
                       ring_inner_ratio: 1.750,
                       ring_outer_ratio: 2.006)
        
        Uranus.geology(mass: 86813000.zettagram(),
                       volume: 68330000.gigameter(),
                       equatorial: 25559.kilometer(),
                       density: 1271.kilogram(),
                       gravity: 8.87.meter(),
                       escape_velocity: 21.1.kilometer(),
                       irradiance: 3.69,
                       geographic_height_variance: nil)
        
        Uranus.orbitals(year_length: 30588.74.day(),
                        perihelion: 2741300.megameter(),
                        aphelion: 3003620.megameter(),
                        velocity: 6.8.kilometer(),
                        inclination: 0.772,
                        eccentricity: 0.0457,
                        day_length: 17.24.hour(),
                        equator_inclination: 82.23,
                        min_distance_from_earth: 2581900.megameter(),
                        max_distance_from_earth: 3157300.megameter())
        
        Uranus.atmosphere(surface_pressure: 1000,
                          average_temperature: 76,
                          total_mass: nil)
        
        Uranus.misc(discovered: "March 13th, 1781")
        
        Uranus.images = [
            ("uranus - ball.jpg", "Uranus is mostly featureless.  However, winds in its atmosphere can reach up to 560 mph"),
            ("uranus - crescent.jpg", "Voyager 2 is the only spacecraft to have visited Uranus.  On its way to Neptune, it turned around to snap a picture of this crescent."),
            ("uranus - moons.jpg", "An infrared image of Uranus, its ring system, and ten of its moons.  Taken by Hubble."),
            ("uranus - rings.jpg", "A false color image of Uranus's known rings.  Uranus's ring system is faint and small compared to Saturn's."),
            ("uranus - storm.jpg", "Infrared images of both sides of the planet, taken by the Keck Telescope to track a storm in the upper atmosphere.")]
        
        Uranus.colors(background: "uranussurface.jpg",
                      color1: "727E7E",
                      color2: "71ACD4")
        
        let Cordelia = Moon(name: "Cordelia",
                            position: 1)
        
        Cordelia.about(description: "Cordelia is the innermost known moon of Uranus. It was discovered from the images taken by Voyager 2 on January 20, 1986, and was given the temporary designation S/1986 U 7. It was not detected again until the Hubble Space Telescope observed it in 1997. Cordelia takes its name from the youngest daughter of Lear in William Shakespeare's King Lear. It is also designated Uranus VI.\n\nOther than its orbit, radius of 20 km and geometric albedo of 0.08 virtually nothing is known about it. In the Voyager 2 images Cordelia appears as an elongated object with its major axis pointing towards Uranus. The ratio of axes of Cordelia's prolate spheroid is 0.7 ± 0.2.\n\nCordelia acts as the inner shepherd satellite for Uranus' Epsilon ring. Cordelia's orbit is within Uranus' synchronous orbit radius, and is therefore slowly decaying due to tidal deceleration.\n\nCordelia is very close to a 5:3 orbital resonance with Rosalind.",
                       wiki: "https://en.wikipedia.org/wiki/Cordelia_(moon)",
                       nasa: "http://solarsystem.nasa.gov/planets/cordelia")
        
        Uranus.moons.append(Cordelia)
        
        let Ophelia = Moon(name: "Ophelia",
                           position: 2)
        
        Ophelia.about(description: "Ophelia is a moon of Uranus. It was discovered from the images taken by Voyager 2 on January 20, 1986, and was given the temporary designation S/1986 U 8. It was not seen until the Hubble Space Telescope recovered it in 2003. Ophelia was named after the daughter of Polonius, Ophelia, in William Shakespeare's play Hamlet. It is also designated Uranus VII.\n\nOther than its orbit, radius of 21 km and geometric albedo of 0.08 virtually nothing is known about it. At the Voyager 2 images Ophelia appears as an elongated object, the major axis pointing towards Uranus. The ratio of axes of the Ophelia's prolate spheroid is 0.7 ± 0.3.\n\nOphelia acts as the outer shepherd satellite for Uranus' Epsilon ring. The orbit of Ophelia is within the synchronous orbit radius of Uranus, and therefore the moon is slowly decaying due to tidal forces.",
                      wiki: "https://en.wikipedia.org/wiki/Ophelia_(moon)",
                      nasa: "http://solarsystem.nasa.gov/planets/ophelia")
        
        Uranus.moons.append(Ophelia)
        
        let Bianca = Moon(name: "Bianca",
                          position: 3)
        
        Bianca.about(description: "Bianca is an inner satellite of Uranus. It was discovered from the images taken by Voyager 2 on January 23, 1986, and was given the temporary designation S/1986 U 9. It was named after the sister of Katherine in Shakespeare's play The Taming of the Shrew. It is also designated Uranus VIII.\n\nBianca belongs to Portia Group of satellites, which also includes Cressida, Desdemona, Juliet, Portia, Rosalind, Cupid, Belinda and Perdita. These satellites have similar orbits and photometric properties. Other than its orbit, radius of 27 km, and geometric albedo of 0.08 virtually nothing is known about it.\n\nAt the Voyager 2 images Bianca appears as an elongated object, the major axis pointing towards Uranus. The ratio of axes of the Bianca's prolate spheroid is 0.7 ± 0.2. Its surface is grey in color.",
                     wiki: "https://en.wikipedia.org/wiki/Bianca_(moon)",
                     nasa: "http://solarsystem.nasa.gov/planets/bianca")
        
        Bianca.display(texture: "biancamap.jpg",
                       model: nil,
                       normalmap: nil)
        
        Uranus.moons.append(Bianca)
        
        let Cressida = Moon(name: "Cressida",
                            position: 4)
        
        Cressida.about(description: "Cressida is an inner satellite of Uranus. It was discovered from the images taken by Voyager 2 on 9 January 1986, and was given the temporary designation S/1986 U 3. It was named after Cressida, the Trojan daughter of Calchas, a tragic heroine who appears in William Shakespeare's play Troilus and Cressida (as well as in tales by Geoffrey Chaucer and others). It is also designated Uranus IX.\n\nCressida belongs to the Portia Group of satellites, which includes Bianca, Desdemona, Juliet, Portia, Rosalind, Cupid, Belinda and Perdita. These satellites have similar orbits and photometric properties. Other than its orbit, radius of 41 km and geometric albedo of 0.08, virtually nothing is known about it.\n\nIn the Voyager 2 images Cressida appears as an elongated object, its major axis pointing towards Uranus. The ratio of axes of Cressida's prolate spheroid is 0.8 ± 0.3. Its surface is grey in color.\n\nCressida may collide with Desdemona within the next 100 million years.",
                       wiki: "https://en.wikipedia.org/wiki/Cressida_(moon)",
                       nasa: "http://solarsystem.nasa.gov/planets/cressida")
        
        Uranus.moons.append(Cressida)
        
        let Desdemona = Moon(name: "Desdemona",
                             position: 5)
        
        Desdemona.about(description: "Desdemona is an inner satellite of Uranus. It was discovered from the images taken by Voyager 2 on 13 January 1986, and was given the temporary designation S/1986 U 6. Desdemona is named after the wife of Othello in William Shakespeare's play Othello. It is also designated Uranus X.\n\nDesdemona belongs to Portia Group of satellites, which also includes Bianca, Cressida, Juliet, Portia, Rosalind, Cupid, Belinda and Perdita. These satellites have similar orbits and photometric properties. Other than its orbit, radius of 32 km and geometric albedo of 0.08 virtually nothing is known about Desdemona.\n\nAt the Voyager 2 images Desdemona appears as an elongated object, the major axis pointing towards Uranus. The ratio of axes of Desdemona's prolate spheroid is 0.6 ± 0.3. Its surface is grey in color.\n\nDesdemona may collide with one of its neighboring moons Cressida or Juliet within the next 100 million years.",
                        wiki: "https://en.wikipedia.org/wiki/Desdemona_(moon)",
                        nasa: "http://solarsystem.nasa.gov/planets/desdemona")
        
        Uranus.moons.append(Desdemona)
        
        let Juliet = Moon(name: "Juliet",
                          position: 6)
        
        Juliet.about(description: "Juliet is an inner satellite of Uranus. It was discovered from the images taken by Voyager 2 on 3 January 1986, and was given the temporary designation S/1986 U 2. It is named after the heroine of William Shakespeare's play Romeo and Juliet. It is also designated Uranus XI.\n\nJuliet belongs to Portia Group of satellites, which also includes Bianca, Cressida, Desdemona, Portia, Rosalind, Cupid, Belinda and Perdita. These satellites have similar orbits and photometric properties. Unfortunately, other than its orbit, radius of 53 km and geometric albedo of 0.08 virtually nothing is known about Juliet.\n\nAt the Voyager 2 images Juliet appears as an elongated object, the major axis pointing towards Uranus. The ratio of axes of Juliet's prolate spheroid is 0.5 ± 0.3, which is rather an extreme value. Its surface is grey in color.\n\nJuliet may collide with Desdemona within the next 100 million years.",
                     wiki: "https://en.wikipedia.org/wiki/Juliet_(moon)",
                     nasa: "http://solarsystem.nasa.gov/planets/juliet")
        
        Uranus.moons.append(Juliet)
        
        let Portia = Moon(name: "Portia",
                          position: 7)
        
        Portia.about(description: "Portia is an inner satellite of Uranus. It was discovered from the images taken by Voyager 2 on 3 January 1986, and was given the temporary designation S/1986 U 1. The moon is named after Portia, the heroine of William Shakespeare's play The Merchant of Venice. It is also designated Uranus XII.\n\nPortia is the second-largest inner satellite of Uranus after Puck. The Portian orbit, which lies inside Uranus' synchronous orbital radius, is slowly decaying due to tidal deceleration. The moon will one day either break up into a planetary ring or hit Uranus.\n\nIt heads a group of satellites called the Portia Group, which includes Bianca, Cressida, Desdemona, Juliet, Rosalind, Cupid, Belinda and Perdita. These satellites have similar orbits and photometric properties.\n\nLittle is known about Portia beyond its size of about 140 km, orbit, and geometric albedo of about 0.08.\n\nIn the Voyager 2 images, Portia appears as an elongated object whose major axis points towards Uranus. The ratio of axes of the Portia's prolate spheroid is 0.8 ± 0.1. Its surface is grey in color. Observations with Hubble Space Telescope and large terrestrial telescopes found water ice absorption features in the spectrum of Portia.",
                     wiki: "https://en.wikipedia.org/wiki/Portia_(moon)",
                     nasa: "http://solarsystem.nasa.gov/planets/portia")
        
        Uranus.moons.append(Portia)
        
        let Rosalind = Moon(name: "Rosalind",
                            position: 8)
        
        Rosalind.about(description: "Rosalind is an inner satellite of Uranus. It was discovered from the images taken by Voyager 2 on 13 January 1986, and was given the temporary designation S/1986 U 4. It was named after the daughter of the banished Duke in William Shakespeare's play As You Like It. It is also designated Uranus XIII.\n\nRosalind belongs to Portia group of satellites, which also includes Bianca, Cressida, Desdemona, Portia, Juliet, Cupid, Belinda and Perdita. These satellites have similar orbits and photometric properties. Other than its orbit, radius of 36 km and geometric albedo of 0.08 virtually nothing is known about Rosalind.\n\nIn the Voyager 2 images Rosalind appears as an almost spherical object. The ratio of axes of Rosalind's prolate spheroid is 0.8-1.0. Its surface is grey in color.\n\nRosalind is very close to a 3:5 orbital resonance with Cordelia.",
                       wiki: "https://en.wikipedia.org/wiki/Rosalind_(moon)",
                       nasa: "http://solarsystem.nasa.gov/planets/rosalind")
        
        Uranus.moons.append(Rosalind)
        
        let Cupid = Moon(name: "Cupid",
                         position: 9)
        
        Cupid.about(description: "Cupid is an inner satellite of Uranus. It was discovered by Mark R. Showalter and Jack J. Lissauer in 2003 using the Hubble Space Telescope. It was named after a character in William Shakespeare's play Timon of Athens.\n\nIt is the smallest of inner Uranian satellites, crudely estimated to be only about 18 km in diameter. This and the dark surface made it too dim to be detected by the Voyager 2 cameras during its Uranus flyby in 1986.\n\nThe orbit of Cupid differs only by 863 km from the orbit of the larger moon Belinda. Unlike Mab and Perdita, Uranian satellites also discovered in 2003, it does not seem to be perturbed.\n\nFollowing its discovery, Cupid was given the temporary designation S/2003 U 2. It is also designated Uranus XXVII.\n\nIt should not be confused with the asteroid 763 Cupido.",
                    wiki: "https://en.wikipedia.org/wiki/Cupid_(moon)",
                    nasa: "http://solarsystem.nasa.gov/planets/cupid")
        
        Uranus.moons.append(Cupid)
        
        let Belinda = Moon(name: "Belinda",
                           position: 10)
        
        Belinda.about(description: "Belinda is an inner satellite of the planet Uranus. Belinda was discovered from the images taken by Voyager 2 on 13 January 1986 and was given the temporary designation S/1986 U 5. It is named after the heroine of Alexander Pope's The Rape of the Lock. It is also designated Uranus XIV.\n\nBelinda belongs to the Portia group of satellites, which also includes Bianca, Cressida, Desdemona, Portia, Juliet, Cupid, Rosalind and Perdita. These satellites have similar orbits and photometric properties. Other than its orbit, radius of 45 km and geometric albedo of 0.08 virtually nothing is known about it.\n\nThe Voyager 2 images show Belinda as an elongated object with its major axis pointing towards Uranus. The moon is very elongated, with its short axis 0.5 ± 0.1 times the long axis. Its surface is grey in color.",
                      wiki: "https://en.wikipedia.org/wiki/Belinda_(moon)",
                      nasa: "http://solarsystem.nasa.gov/planets/belinda")
        
        Uranus.moons.append(Belinda)
        
        let Perdita = Moon(name: "Perdita",
                           position: 11)
        
        Perdita.about(description: "Perdita is an inner satellite of Uranus. Perdita's discovery was complicated. The first photographs of Perdita were taken by the Voyager 2 spacecraft in 1986, but it was not recognized from the photographs for more than a decade. In 1999, the moon was noticed by Erich Karkoschka and reported. But because no further pictures could be taken to confirm its existence, it was officially demoted in 2001. However, in 2003, pictures taken by the Hubble Space Telescope managed to pick up an object where Perdita was supposed to be, finally confirming its existence.\n\nFollowing its discovery in 1999, it was given the temporary designation of S/1986 U 10. It was named Perdita (Latin for 'lost') after the daughter of Leontes and Hermione in William Shakespeare's play The Winter's Tale. The moon is also designated Uranus XXV.\n\nThe moon orbits between Belinda and Puck. The above-mentioned Hubble measurements prove that Perdita does not follow a direct Keplerian motion around Uranus. Instead, it is clearly caught in a 43:44 orbital resonance with the nearby moon Belinda. It is also close to an 8:7 resonance with Rosalind.\n\nPerdita belongs to the Portia group of satellites, which also includes Bianca, Cressida, Desdemona, Portia, Juliet, Cupid, Rosalind and Belinda. These satellites have similar orbits and photometric properties. Little is known about Perdita apart from its orbit, radius of 15 km and geometric albedo of 0.08.",
                      wiki: "https://en.wikipedia.org/wiki/Perdita_(moon)",
                      nasa: "http://solarsystem.nasa.gov/planets/perdita")
        
        Uranus.moons.append(Perdita)
        
        let Puck = Moon(name: "Puck",
                        position: 12)
        
        Puck.about(description: "Puck is an inner moon of Uranus. It was discovered in December 1985 by the Voyager 2 spacecraft. The name Puck follows the convention of naming Uranus's moons after characters from Shakespeare. The orbit of Puck lies between the rings of Uranus and the first of Uranus's large moons, Miranda. Puck is approximately spherical in shape and has diameter of about 162 km. It has a dark, heavily cratered surface, which shows spectral signs of water ice.\n\nPuck—the largest inner moon of Uranus—was discovered from the images taken by Voyager 2 on 30 December 1985. It was given the temporary designation S/1985 U 1.\n\nThe moon was later named after the character Puck who appears in Shakespeare's A Midsummer Night's Dream, a little sprite who travels around the globe at night with the fairies. In Celtic mythology and English folklore, a Puck is a mischievous sprite, imagined as an evil demon by Christians.\n\nPuck is the largest small inner moon of Uranus, which orbits inside the orbit of Miranda. It is intermediate in size between Portia (the second-largest inner moon) and Miranda (the smallest of the five large classical moons). Puck's orbit is located between the rings of Uranus and Miranda. Little is known about Puck aside from its orbit, radius of about 81 km, and geometric albedo in visible light of approximately 0.11.\n\nOf the moons discovered by the Voyager 2 imaging team, only Puck was discovered early enough that the probe could be programmed to image it in some detail. Images showed that Puck has a shape of a slightly prolate spheroid (ratio between axes is 0.97 ± 0.04). Its surface is heavily cratered and is grey in color. There are three named craters on the surface of Puck, the largest being about 45 km in diameter. Observations with the Hubble Space Telescope and large terrestrial telescopes found water-ice absorption features in the spectrum of Puck.\n\nNothing is known about the internal structure of Puck. It is probably made of a mixture of water ice with the dark material similar to that found in the rings. This dark material is probably made of rocks or radiation-processed organics. The absence of craters with bright rays implies that Puck is not differentiated, meaning that ice and non-ice components have not separated from each other into a core and mantle.",
                   wiki: "https://en.wikipedia.org/wiki/Puck_(moon)",
                   nasa: "http://solarsystem.nasa.gov/planets/puck")
        
        Uranus.moons.append(Puck)
        
        let Mab = Moon(name: "Mab",
                       position: 13)
        
        Mab.about(description: "Mab, or Uranus XXVI (26), is an inner satellite of Uranus. It was discovered by Mark R. Showalter and Jack J. Lissauer in 2003 using the Hubble Space Telescope. It was named after Queen Mab, a fairy queen from English folklore who is mentioned in William Shakespeare's play Romeo and Juliet.\n\nBecause the moon is small and dark, it was not seen in the heavily scrutinized images taken by Voyager 2 during its Uranus flyby in 1986. However, it is brighter than another moon, Perdita, which was discovered from Voyager's photos in 1997. This led scientists to re-examine the old photos again, and the satellite was finally found in the images.\n\nThe size of Mab is not known exactly. If it is as dark as Puck, it is about 24 km in diameter. On the other hand, if it is brightly coloured like the neighbouring moon Miranda, it would be even smaller than Cupid and comparable to the smallest outer satellites.\n\nMab is heavily perturbed. The actual source for perturbation is still unclear, but is presumed to be one or more of the nearby orbiting moons.\n\nMab orbits at the same distance from Uranus as the μ ring (formerly known as R/2003 U 1), a recently discovered dusty ring. The moon is nearly the optimal size for dust production, since larger moons can recollect the escaping dust and smaller moons have too small surface areas for supplying the ring via ring particle or meteoroid collisions. No rings associated with Perdita and Cupid have been found, probably because Belinda limits the lifetimes of dust they generate.\n\nFollowing its discovery, Mab was given the temporary designation S/2003 U 1. The moon is also designated Uranus XXVI.",
                  wiki: "https://en.wikipedia.org/wiki/Mab_(moon)",
                  nasa: "http://solarsystem.nasa.gov/planets/perdita")
        
        Uranus.moons.append(Mab)
        
        let Miranda = Moon(name: "Miranda",
                           position: 14)
        
        Miranda.about(description: "Miranda or Uranus V is the smallest and innermost of Uranus's five round satellites. Like the other large moons of Uranus, Miranda orbits close to its planet's equatorial plane. Because Uranus orbits the Sun on its side, Miranda's orbit is perpendicular to the ecliptic and shares Uranus's extreme seasonal cycle. At just 470 km in diameter, Miranda is one of the smallest objects in the Solar System known to be spherical under its own gravity. Of the bodies that are known to be in hydrostatic equilibrium, only Saturn's moon Mimas is smaller.\n\nMiranda has one of the most extreme and varied topographies of any object in the Solar System, including Verona Rupes, a 5- to 10-kilometer-high scarp that is the tallest cliffs in the Solar System, and chevron-shaped tectonic features called coronae. The origin and evolution of this varied geology, the most of any Uranian satellite, are still not fully understood, and multiple hypotheses exist regarding Miranda's formation.\n\nMiranda was discovered by Gerard Kuiper on 16 February 1948 at McDonald Observatory, and named after Miranda from William Shakespeare's play The Tempest.\n\nThe only close-up images of Miranda are from the Voyager 2 probe, which made observations of Miranda during its Uranus flyby in January 1986. During the flyby, Miranda's southern hemisphere pointed towards the Sun, so only that part was studied.",
                      wiki: "https://en.wikipedia.org/wiki/Miranda_(moon)",
                      nasa: "http://solarsystem.nasa.gov/planets/miranda")
        
        Miranda.display(texture: "mirandamap.jpg",
                        model: nil,
                        normalmap: nil)
        
        Uranus.moons.append(Miranda)
        
        let Ariel = Moon(name: "Ariel",
                         position: 15)
        
        Ariel.about(description: "Ariel is the fourth-largest of the 27 known moons of Uranus. Ariel orbits and rotates in the equatorial plane of Uranus, which is almost perpendicular to the orbit of Uranus, and so has an extreme seasonal cycle.\n\nIt was discovered in October 1851 by William Lassell, and named for a character in two different pieces of literature. As of 2012, much of the detailed knowledge of Ariel derives from a single flyby of Uranus performed by the spacecraft Voyager 2 in 1986, which managed to image around 35% of the moon's surface. There are no active plans at present to return to study the moon in more detail, although various concepts such as a Uranus orbiter and probe are proposed from time to time.\n\nAfter Miranda, Ariel is the second-smallest of Uranus' five major rounded satellites, and the second-closest to its planet. Among the smallest of the Solar System's 19 known spherical moons (it ranks 14th among them in diameter), it is believed to be composed of roughly equal parts ice and rocky material. Its mass is approximately equal in magnitude to Earth's hydrosphere.\n\nLike all of Uranus' moons, Ariel probably formed from an accretion disc that surrounded the planet shortly after its formation, and, like other large moons, it is likely differentiated, with an inner core of rock surrounded by a mantle of ice. Ariel has a complex surface consisting of extensive cratered terrain cross-cut by a system of scarps, canyons, and ridges. The surface shows signs of more recent geological activity than other Uranian moons, most likely due to tidal heating.",
                    wiki: "https://en.wikipedia.org/wiki/Ariel_(moon)",
                    nasa: "http://solarsystem.nasa.gov/planets/ariel")
        
        Ariel.display(texture: "arielmap.jpg",
                      model: nil,
                      normalmap: nil)
        
        Uranus.moons.append(Ariel)
        
        let Umbriel = Moon(name: "Umbriel",
                           position: 16)
        
        Umbriel.about(description: "Umbriel is a moon of Uranus discovered on October 24, 1851, by William Lassell. It was discovered at the same time as Ariel and named after a character in Alexander Pope's poem The Rape of the Lock. Umbriel consists mainly of ice with a substantial fraction of rock, and may be differentiated into a rocky core and an icy mantle. The surface is the darkest among Uranian moons, and appears to have been shaped primarily by impacts. However, the presence of canyons suggests early endogenic processes, and the moon may have undergone an early endogenically driven resurfacing event that obliterated its older surface.\n\nCovered by numerous impact craters reaching 210 km (130 mi) in diameter, Umbriel is the second most heavily cratered satellite of Uranus after Oberon. The most prominent surface feature is a ring of bright material on the floor of Wunda crater. This moon, like all moons of Uranus, probably formed from an accretion disk that surrounded the planet just after its formation. The Uranian system has been studied up close only once, by the spacecraft Voyager 2 in January 1986. It took several images of Umbriel, which allowed mapping of about 40% of the moon’s surface.",
                      wiki: "https://en.wikipedia.org/wiki/Umbriel_(moon)",
                      nasa: "http://solarsystem.nasa.gov/planets/umbriel")
        
        Umbriel.display(texture: "umbrielmap.jpg",
                        model: nil,
                        normalmap: nil)
        
        Uranus.moons.append(Umbriel)
        
        let Titania = Moon(name: "Titalia",
                           position: 17)
        
        Titania.about(description: "Titania is the largest of the moons of Uranus and the eighth largest moon in the Solar System at a diameter of 1,578 kilometres (981 mi). Discovered by William Herschel in 1787, Titania is named after the queen of the fairies in Shakespeare's A Midsummer Night's Dream. Its orbit lies inside Uranus's magnetosphere.\n\nTitania consists of approximately equal amounts of ice and rock, and is probably differentiated into a rocky core and an icy mantle. A layer of liquid water may be present at the core–mantle boundary. The surface of Titania, which is relatively dark and slightly red in color, appears to have been shaped by both impacts and endogenic processes. It is covered with numerous impact craters reaching up to 326 kilometres (203 mi) in diameter, but is less heavily cratered than Oberon, outermost of the five large moons of Uranus. Titania probably underwent an early endogenic resurfacing event which obliterated its older, heavily cratered surface. Titania's surface is cut by a system of enormous canyons and scarps, the result of the expansion of its interior during the later stages of its evolution. Like all major moons of Uranus, Titania probably formed from an accretion disk which surrounded the planet just after its formation.\n\nInfrared spectroscopy conducted from 2001 to 2005 revealed the presence of water ice as well as frozen carbon dioxide on the surface of Titania, which in turn suggested that the moon may have a tenuous carbon dioxide atmosphere with a surface pressure of about 10 nanopascals (10−13 bar). Measurements during Titania's occultation of a star put an upper limit on the surface pressure of any possible atmosphere at 1–2 mPa (10–20 nbar).\n\nThe Uranian system has been studied up close only once, by the spacecraft Voyager 2 in January 1986. It took several images of Titania, which allowed mapping of about 40% of its surface.",
                      wiki: "https://en.wikipedia.org/wiki/Titania_(moon)",
                      nasa: "http://solarsystem.nasa.gov/planets/titania")
        
        Titania.display(texture: "titaniamap.jpg",
                        model: nil,
                        normalmap: nil)
        
        Uranus.moons.append(Titania)
        
        let Oberon = Moon(name: "Oberon",
                          position: 18)
        
        Oberon.about(description: "Oberon, also designated Uranus IV, is the outermost major moon of the planet Uranus. It is the second-largest and second most massive of the Uranian moons, and the ninth most massive moon in the Solar System. Discovered by William Herschel in 1787, Oberon is named after the mythical king of the fairies who appears as a character in Shakespeare's A Midsummer Night's Dream. Its orbit lies partially outside Uranus's magnetosphere.\n\nIt is likely that Oberon formed from the accretion disk that surrounded Uranus just after the planet's formation. The moon consists of approximately equal amounts of ice and rock, and is probably differentiated into a rocky core and an icy mantle. A layer of liquid water may be present at the boundary between the mantle and the core. The surface of Oberon, which is dark and slightly red in color, appears to have been primarily shaped by asteroid and comet impacts. It is covered by numerous impact craters reaching 210 km in diameter. Oberon possesses a system of chasmata (graben or scarps) formed during crustal extension as a result of the expansion of its interior during its early evolution.\n\nThe Uranian system has been studied up close only once: the spacecraft Voyager 2 took several images of Oberon in January 1986, allowing 40% of the moon's surface to be mapped.",
                     wiki: "https://en.wikipedia.org/wiki/Oberon_(moon)",
                     nasa: "http://solarsystem.nasa.gov/planets/oberon")
        
        Uranus.moons.append(Oberon)
        
        let Francisco = Moon(name: "Francisco",
                             position: 19)
        
        Francisco.about(description: "Francisco is the innermost irregular satellite of Uranus.\n\nFrancisco was discovered by Matthew J. Holman, et al. and Brett J. Gladman, et al. in 2003 from pictures taken in 2001 and given the provisional designation S/2001 U 3. Confirmed as Uranus XXII, it was named after a lord in William Shakespeare's play The Tempest.",
                        wiki: "https://en.wikipedia.org/wiki/Francisco_(moon)",
                        nasa: "http://solarsystem.nasa.gov/planets/francisco")
        
        Uranus.moons.append(Francisco)
        
        let Caliban = Moon(name: "Caliban",
                           position: 20)
        
        Caliban.about(description: "Caliban is the second-largest retrograde irregular satellite of Uranus. It was discovered on 6 September 1997 by Brett J. Gladman, Philip D. Nicholson, Joseph A. Burns, and John J. Kavelaars using the 200-inch Hale telescope together with Sycorax and given the temporary designation S/1997 U 1.\n\nCaliban follows a distant orbit, more than 10 times further from Uranus than the furthest regular moon Oberon. Its orbit is retrograde, moderately inclined and slightly eccentric. The orbital parameters suggest that it may belong to the same dynamic cluster as Stephano and Francisco, suggesting common origin.\n\nThe diagram illustrates the orbital parameters of the retrograde irregular satellites of Uranus (in polar co-ordinates) with the eccentricity of the orbits represented by the segments extending from the pericentre to the apocentre.\n\nIts diameter is estimated at 72 km (assuming albedo of 0.04) making it the second largest irregular satellite of Uranus, half the size of Sycorax, the biggest irregular satellite of Uranus.\n\nSomewhat inconsistent reports put Caliban in light-red category (B–V = 0.83 V–R = 0.52, B–V = 0.84 ± 0.03 V–R = 0.57 ± 0.03), redder than Himalia but still less red than most Kuiper belt objects. Caliban may be slightly redder than Sycorax. It also absorbs light at 0.7 μm, and one group of astronomers think this may be a result of liquid water that modified the surface.\n\nThe light curve suggests the rotation period of Caliban is about 2.7h.\n\nCaliban is hypothesized to be a captured object: it did not form in the accretionary disk that existed around Uranus just after its formation. The exact capture mechanism is not known, but capturing a moon requires the dissipation of energy. The possible capture processes include: gas drag in the protoplanetary disk, many body interactions and the capture during the fast growth of the Uranus' mass (so-called \"pull-down\").",
                      wiki: "https://en.wikipedia.org/wiki/Caliban_(moon)",
                      nasa: "http://solarsystem.nasa.gov/planets/caliban")
        
        Uranus.moons.append(Caliban)
        
        let Stephano = Moon(name: "Stephano",
                            position: 21)
        
        Stephano.about(description: "Stephano is a retrograde irregular satellite of Uranus. It was discovered by Brett J. Gladman, et al. in 1999, and given the provisional designation S/1999 U 2.\n\nConfirmed as Uranus XX, it was named after the drunken butler in William Shakespeare's play The Tempest in August 2000.\n\nThe orbital parameters suggest that it may belong to the same dynamic cluster as Caliban, suggesting common origin.",
                       wiki: "https://en.wikipedia.org/wiki/Stephano_(moon)",
                       nasa: "http://solarsystem.nasa.gov/planets/stephano")
        
        Uranus.moons.append(Stephano)
        
        let Trinculo = Moon(name: "Triculo",
                            position: 22)
        
        Trinculo.about(description: "Trinculo is a retrograde irregular satellite of Uranus. It was discovered by a group of astronomers led by Holman, et al. on 13 August 2001, and given the temporary designation S/2001 U 1.\n\nConfirmed as Uranus XXI, it was named after the drunken jester Trinculo in William Shakespeare's play The Tempest.",
                       wiki: "https://en.wikipedia.org/wiki/Trinculo_(moon)",
                       nasa: "http://solarsystem.nasa.gov/planets/trinculo")
        
        Uranus.moons.append(Trinculo)
        
        let Sycorax = Moon(name: "Sycorax",
                           position: 23)
        
        Sycorax.about(description: "Sycorax is the largest retrograde irregular satellite of Uranus. Sycorax was discovered on 6 September 1997 by Brett J. Gladman, Philip D. Nicholson, Joseph A. Burns, and John J. Kavelaars using the 200-inch Hale telescope, together with Caliban, and given the temporary designation S/1997 U 2.\n\nOfficially confirmed as Uranus XVII, it was named after Sycorax, Caliban's mother in William Shakespeare's play The Tempest.\n\nSycorax follows a distant orbit, more than 20 times further from Uranus than the furthest regular moon, Oberon. Its orbit is retrograde, moderately inclined and eccentric. The orbital parameters suggest that it may belong, together with Setebos and Prospero, to the same dynamic cluster, suggesting common origin.\n\nThe diagram illustrates the orbital parameters of the retrograde irregular satellites of Uranus (in polar co-ordinates) with the eccentricity of the orbits represented by the segments extending from the pericentre to the apocentre.\n\nThe diameter of Sycorax is estimated at 165 km based on the thermal emission data from Spitzer and Herschel Space telescopes making it the largest irregular satellite of Uranus, comparable in size with Puck and with Himalia, the biggest irregular satellite of Jupiter.\n\nThe satellite appears light-red in the visible spectrum (colour indices B–V = 0.87 V–R = 0.44, B–V = 0.78 ± 0.02 V–R = 0.62 ± 0.01, B–V = 0.839 ± 0.014 V–R = 0.531 ± 0.005), redder than Himalia but still less red than most Kuiper belt objects. However, in the near infrared, the spectrum turns blue between 0.8 and 1.25 μm and finally becomes neutral at the longer wavelengths.\n\nThe rotation period of Sycorax is estimated at about 3.6 hours. Rotation causes periodical variations of the visible magnitude with the amplitude of 0.07.\n\nIt is hypothesized that Sycorax is a captured object; it did not form in the accretion disk which existed around Uranus just after its formation. No exact capture mechanism is known; but capturing a moon requires the dissipation of energy. Possible capture processes include gas drag in the protoplanetary disk and many-body interactions and capture during the fast growth of Uranus's mass (so called pull-down).",
                      wiki: "https://en.wikipedia.org/wiki/Sycorax_(moon)",
                      nasa: "http://solarsystem.nasa.gov/planets/sycorax")
        
        Uranus.moons.append(Sycorax)
        
        let Margaret = Moon(name: "Margaret",
                            position: 24)
        
        Margaret.about(description: "Margaret is the only prograde irregular satellite of Uranus. It was discovered by Scott S. Sheppard, et al. in 2003 and given the provisional designation S/2003 U 3.\n\nConfirmed as Uranus XXIII, it was named after the servant of Hero in William Shakespeare's play Much Ado About Nothing.\n\nMargaret stands out as the only prograde irregular satellite of Uranus. The diagram illustrates the orbital parameters of Margaret, unique among the irregular satellites of Uranus, with inclination on the vertical axis and the eccentricity of the orbits represented by the segments extending from the pericentre to the apocentre.\n\nMargaret's inclination of 57° is close to the limit of stability. The intermediate inclinations 60 < i < 140 are devoid of known moons due to the Kozai instability. In this instability region, solar perturbations at apoapse cause the moons in this region to acquire large eccentricities that lead to collisions or ejection over 10 million to a billion years. Margaret's periapsis precession period (Pw) is almost 1.6 million years long.\n\nIn 2008, Margaret's current eccentricity was 0.7979. This temporarily gives Margaret the most eccentric orbit of any moon in the Solar System, though Nereid's mean eccentricity is greater.",
                       wiki: "https://en.wikipedia.org/wiki/Margaret_(moon)",
                       nasa: "http://solarsystem.nasa.gov/planets/margaret")
        
        Uranus.moons.append(Margaret)
        
        let Prospero = Moon(name: "Prospero",
                            position: 25)
        
        Prospero.about(description: "Prospero is a relatively small retrograde irregular satellite of Uranus discovered on 18 July 1999 by the astrophysicist Matthew Holman and his team, and given the provisional designation S/1999 U 3. Confirmed as Uranus XVIII it was named after the sorcerer Prospero in William Shakespeare's play The Tempest.\n\nThe orbital parameters suggest that it may belong to the same dynamic cluster as Sycorax and Setebos, suggesting common origin. However, this suggestion does not appear to be supported by the observed colours. The satellite appears neutral (grey) in visible light (colour indices B-V=0.80, R-V=0.39), similar to Setebos but different from Sycorax (which is light red).",
                       wiki: "https://en.wikipedia.org/wiki/Prospero_(moon)",
                       nasa: "http://solarsystem.nasa.gov/planets/prospero")
        
        Uranus.moons.append(Prospero)
        
        let Setebos = Moon(name: "Setebos",
                           position: 26)
        
        Setebos.about(description: "Setebos is one of the outermost retrograde irregular satellites of Uranus. It was discovered on 18 July 1999 by John J. Kavelaars et al. and provisionally designated S/1999 U 1.\n\nConfirmed as Uranus XIX, it is named after the god worshipped by Caliban and Sycorax in William Shakespeare's play The Tempest.\n\nThe orbital parameters suggest that it may belong to the same dynamic cluster as Sycorax and Prospero, suggesting common origin. However, this suggestion does not appear to be supported by the observed colours. The satellite appears neutral (grey) in visible light (colour indices B-V=0.77, R-V=0.35), similar to Prospero but different from Sycorax (which is light red).\n\nIronically, a crater on Umbriel is also named after Setebos, but with the spelling Setibos.",
                      wiki: "https://en.wikipedia.org/wiki/Setebos_(moon)",
                      nasa: "http://solarsystem.nasa.gov/planets/setebos")
        
        Uranus.moons.append(Setebos)
        
        let Ferdinand = Moon(name: "Ferdinand",
                             position: 27)
        
        Ferdinand.about(description: "Ferdinand is the outermost retrograde irregular satellite of Uranus. It was discovered by Matthew J. Holman, John J. Kavelaars, Dan Milisavljevic, and Brett J. Gladman on August 13, 2001, and given the provisional designation S/2001 U 2.\n\nDespite being seen again on September 21 and November 15 and even a year later on August 13 and September 5, 2002, it was eventually lost. It was finally recovered on September 24, 2003, by Scott S. Sheppard on images obtained by David C. Jewitt and himself on August 29 – 30 and September 20 of that year. Confirming observations were made by Holman on September 30.\n\nDesignated Uranus XXIV, it was named after the son of the King of Naples in William Shakespeare's play The Tempest.\n\nFerdinand is the most distant known satellite of Uranus. It follows a retrograde, modestly inclined but highly eccentric orbit. The diagram illustrates the orbital parameters of the retrograde irregular satellites of Uranus (in polar co-ordinates) with the eccentricity of the orbits represented by the segments extending from the pericentre to the apocentre.",
                        wiki: "https://en.wikipedia.org/wiki/Ferdinand_(moon)",
                        nasa: "http://solarsystem.nasa.gov/planets/ferdinand")
        
        Uranus.moons.append(Ferdinand)
        
        
        //----------------------------------------------------------------------------------------------
        let Neptune = Planet(name: "Neptune",
                             type: Type.Ice,
                             position: 8, classification: Class.Major)
        
        Neptune.about(description: "Neptune is the eighth and farthest known planet from the Sun in the Solar System. In the Solar System, it is the fourth-largest planet by diameter, the third-most-massive planet, and the densest giant planet. Neptune is 17 times the mass of Earth and is slightly more massive than its near-twin Uranus, which is 15 times the mass of Earth and slightly larger than Neptune. Neptune orbits the Sun once every 164.8 years at an average distance of 30.1 astronomical units (4.50×109 km). It is named after the Roman god of the sea and has the astronomical symbol ♆, a stylised version of the god Neptune's trident.\n\nNeptune is not visible to the unaided eye and is the only planet in the Solar System found by mathematical prediction rather than by empirical observation. Unexpected changes in the orbit of Uranus led Alexis Bouvard to deduce that its orbit was subject to gravitational perturbation by an unknown planet. Neptune was subsequently observed with a telescope on 23 September 1846 by Johann Galle within a degree of the position predicted by Urbain Le Verrier. Its largest moon, Triton, was discovered shortly thereafter, though none of the planet's remaining known 14 moons were located telescopically until the 20th century. The planet's distance from Earth gives it a very small apparent size, making it challenging to study with Earth-based telescopes. Neptune was visited by Voyager 2, when it flew by the planet on 25 August 1989. The advent of the Hubble Space Telescope and large ground-based telescopes with adaptive optics has recently allowed for additional detailed observations from afar.\n\nNeptune's composition can be compared and contrasted with the Solar System's other giant planets. Like Jupiter and Saturn, Neptune's atmosphere is composed primarily of hydrogen and helium, along with traces of hydrocarbons and possibly nitrogen, but it contains a higher proportion of \"ices\" such as water, ammonia, and methane. However, its interior, like that of Uranus, is primarily composed of ices and rock, which is why Uranus and Neptune are normally considered \"ice giants\" to emphasise this distinction. Traces of methane in the outermost regions in part account for the planet's blue appearance.\n\nIn contrast to the hazy, relatively featureless atmosphere of Uranus, Neptune's atmosphere has active and visible weather patterns. For example, at the time of the Voyager 2 flyby in 1989, the planet's southern hemisphere had a Great Dark Spot comparable to the Great Red Spot on Jupiter. These weather patterns are driven by the strongest sustained winds of any planet in the Solar System, with recorded wind speeds as high as 2,100 kilometres per hour (580 m/s; 1,300 mph). Because of its great distance from the Sun, Neptune's outer atmosphere is one of the coldest places in the Solar System, with temperatures at its cloud tops approaching 55 K (−218 °C). Temperatures at the planet's centre are approximately 5,400 K (5,100 °C). Neptune has a faint and fragmented ring system (labelled \"arcs\"), which was first detected during the 1960s and confirmed by Voyager 2.",
                      wiki: "https://en.wikipedia.org/wiki/Neptune",
                      nasa: "http://solarsystem.nasa.gov/planets/neptune")
        
        Neptune.display(texture: "neptunemap.jpg",
                        model: nil,
                        normalmap: nil,
                        ringmap: nil,
                        ring_transparencymap: nil,
                        ring_inner_ratio: nil,
                        ring_outer_ratio: nil)
        
        Neptune.geology(mass: 10241300.exogram(),
                        volume: 62540000.gigameter(),
                        equatorial: 24764.kilometer(),
                        density: 1638.kilogram(),
                        gravity: 11.15.meter(),
                        escape_velocity: 23.5.kilometer(),
                        irradiance: 1.508,
                        geographic_height_variance: nil)
        
        Neptune.orbitals(year_length: 59799.9.day(),
                         perihelion: 4444450.megameter(),
                         aphelion: 4545670.megameter(),
                         velocity: 5.43.kilometer(),
                         inclination: 1.769,
                         eccentricity: 0.0113,
                         day_length: 16.11.hour(),
                         equator_inclination: 28.32,
                         min_distance_from_earth: 4305900.megameter(),
                         max_distance_from_earth: 4687300.megameter())
        
        Neptune.atmosphere(surface_pressure: 1000,
                           average_temperature: 72,
                           total_mass: nil)
        
        Neptune.misc(discovered: "September 23rd, 1846")
        
        Neptune.images = [
            ("neptune - clouds.jpg", "This image, taken by Voyager 2, shows cloud differentiation, or layering.  The upper clouds are arounds 30 miles above the rest of the \"surface\"."),
            ("neptune - disk.jpg", "Voyager 2 is the only spacecraft to explore Neptune.  This image was taken when the probe was still 4.4 million miles away."),
            ("neptune - rings.jpg", "Uranus has a very small and faint ring system."),
            ("neptune - storms.jpg", "Neptune's prominent storms: the Great Dark Spot at the equator, Scooter, the white blob below the Great Dark Spot, and the Small Dark Spot by the south pole."),
            ("neptune - triton.jpg", "Triton, seen behind Neptune in this Voyager 2 shot, makes up 99.5% of the mass of Neptune's moons.")]
        
        Neptune.colors(background: "neptunesurface.jpg",
                       color1: "565DA0",
                       color2: "88daf6")
        
        let Naiad = Moon(name: "Naiad",
                         position: 1)
        
        Naiad.about(description: "Naiad, also known as Neptune III, is the innermost satellite of Neptune, named after the Naiads of Greek legend.\n\nNaiad was discovered sometime before mid-September 1989 from the images taken by the Voyager 2 probe. The last moon to be discovered during the flyby, it was designated S/1989 N 6. The discovery was announced on September 29, 1989, in the IAU Circular No. 4867, but the text only talks of \"25 frames taken over 11 days\", giving a discovery date of sometime before September 18. The name was given on 16 September 1991.\n\nNaiad is irregularly shaped and probably has not been modified by any internal geological processes since its formation. It is likely that it is a rubble pile re-accreted from fragments of Neptune's original satellites, which were smashed up by perturbations from Triton soon after that moon's capture into a very eccentric initial orbit.\n\nSince the Voyager 2 flyby, the Neptune system has been extensively studied from ground-based observatories and the Hubble Space Telescope as well. In 2002–03 the Keck telescope observed the system using adaptive optics and detected easily the largest four inner satellites. Thalassa was found with some image processing, but Naiad was not located. Hubble has the ability to detect all the known satellites and possible new satellites even dimmer than those found by Voyager 2. On October 8, 2013 the SETI Institute announced that Naiad had been located in archived Hubble imagery from 2004. The suspicion that the loss of positioning was due to considerable errors in Naiad's ephemeris proved correct as Naiad was ultimately located 80 degrees from its expected position.",
                    wiki: "https://en.wikipedia.org/wiki/Naiad_(moon)",
                    nasa: "http://solarsystem.nasa.gov/planets/naiad")
        
        Neptune.moons.append(Naiad)
        
        let Thalassa = Moon(name: "Thalassa",
                            position: 2)
        
        Thalassa.about(description: "Thalassa, also known as Neptune IV, is the second innermost satellite of Neptune. Thalassa was named after sea goddess Thalassa, a daughter of Aether and Hemera from Greek mythology. \"Thalassa\" is also the Greek word for \"sea\".\n\nThalassa was discovered sometime before mid-September 1989 from the images taken by the Voyager 2 probe. It was given the temporary designation S/1989 N 5. The discovery was announced (IAUC 4867) on September 29, 1989, but the text only talks of \"25 frames taken over 11 days\", giving a discovery date of sometime before September 18. The name was given on 16 September 1991.\n\nThalassa is irregularly shaped and shows no sign of any geological modification. It is likely that it is a rubble pile re-accreted from fragments of Neptune's original satellites, which were smashed up by perturbations from Triton soon after that moon's capture into a very eccentric initial orbit. Unusually for irregular bodies, it appears to be roughly disk-shaped.\n\nSince the Thalassian orbit is below Neptune's synchronous orbit radius, it is slowly spiralling inward due to tidal deceleration and may eventually impact Neptune's atmosphere, or break up into a planetary ring upon passing its Roche limit due to tidal stretching. Relatively soon after, the spreading debris may impinge upon Despina's orbit.",
                       wiki: "https://en.wikipedia.org/wiki/Thalassa_(moon)",
                       nasa: "http://solarsystem.nasa.gov/planets/thalassa")
        
        Neptune.moons.append(Thalassa)
        
        let Despina = Moon(name: "Despina",
                           position: 3)
        
        Despina.about(description: "Despina, also known as Neptune V, is the third closest inner satellite of Neptune. It is named after Despoina, a nymph who was a daughter of Poseidon and Demeter.\n\nDespina was discovered in late July 1989 from the images taken by the Voyager 2 probe. It was given the temporary designation S/1989 N 3. The discovery was announced (IAUC 4824) on August 2, 1989, but the text only talks of \"10 frames taken over 5 days\", giving a discovery date of sometime before July 28. The name was given on 16 September 1991.\n\nDespina is irregularly shaped and shows no sign of any geological modification. It is likely that it is a rubble pile re-accreted from fragments of Neptune's original satellites, which were smashed up by perturbations from Triton soon after that moon's capture into a very eccentric initial orbit.\n\nDespina's orbit lies close to but outside of the orbit of Thalassa and just inside the Le Verrier ring. As it is also below Neptune's synchronous orbit radius, it is slowly spiralling inward due to tidal deceleration and may eventually impact Neptune's atmosphere, or break up into a planetary ring upon passing its Roche limit due to tidal stretching.\n\nThe diameter of Despina is approximately 150 km (90 mi) wide.",
                      wiki: "https://en.wikipedia.org/wiki/Despina_(moon)",
                      nasa: "http://solarsystem.nasa.gov/planets/despina")
        
        Neptune.moons.append(Despina)
        
        let Galatea = Moon(name: "Galatea",
                           position: 4)
        
        Galatea.about(description: "Galatea, also known as Neptune VI, is the fourth closest inner satellite of Neptune. It is named after Galatea, one of the Nereids of Greek legend, with whom the Cyclops Polyphemus was in love.\n\nGalatea was discovered in late July 1989 from the images taken by the Voyager 2 probe. It was given the temporary designation S/1989 N 4 The discovery was announced (IAUC 4824) on August 2, 1989, but the text only talks of \"10 frames taken over 5 days\", giving a discovery date of sometime before July 28. The name was given on 16 September 1991.\n\nIt is irregularly shaped and shows no sign of any geological modification. It is likely that it is a rubble pile re-accreted from fragments of Neptune's original satellites, which were smashed up by perturbations from Triton soon after that moon's capture into a very eccentric initial orbit.\n\nGalatea's orbit lies below Neptune's synchronous orbit radius, so it is slowly spiralling inward due to tidal deceleration and may eventually impact Neptune's atmosphere, or break up into a planetary ring upon passing its Roche limit due to tidal stretching.\n\nGalatea appears to be a shepherd moon for the Adams ring that is 1000 km outside its orbit. Resonances with Galatea in the ratio 42:43 are also considered the most likely mechanism for confining the unique ring arcs that exist in this ring. Galatea's mass has been estimated based on the radial perturbations it induces on the ring.",
                      wiki: "https://en.wikipedia.org/wiki/Galatea_(moon)",
                      nasa: "http://solarsystem.nasa.gov/planets/galatea")
        
        Neptune.moons.append(Galatea)
        
        let Larissa = Moon(name: "Larissa",
                           position: 5)
        
        Larissa.about(description: "Larissa, also known as Neptune VII, is the fifth-closest inner satellite of Neptune. It is named after Larissa, a lover of Poseidon (Neptune) in Greek mythology and eponymous nymph of the city in Thessaly, Greece.\n\nIt was first discovered by Harold J. Reitsema, William B. Hubbard, Larry A. Lebofsky and David J. Tholen, based on fortuitous ground-based stellar occultation observations on May 24, 1981, given the temporary designation S/1981 N 1 and announced on May 29, 1981. The moon was recovered and confirmed to be the only object in its orbit during the Voyager 2 flyby in 1989 after which it received the additional designation S/1989 N 2 on August 2, 1989. The announcement by Stephen P. Synnott spoke of “10 frames taken over 5 days”, which gives a recovery date sometime before July 28. The name was given on September 16, 1991.\n\nThe fourth-largest satellite of Neptune, Larissa is irregular (non-spherical) in shape and appears to be heavily cratered, with no sign of any geological modification. Little else is known about it. It is likely that Larissa, like the other satellites inward of Triton, is a rubble pile re-accreted from fragments of Neptune's original satellites, which were smashed up by perturbations from Triton soon after that moon's capture into a very eccentric initial orbit.\n\nLarissa's orbit is circular but not perfect and lies below Neptune's synchronous orbit radius, so it is slowly spiralling inward due to tidal deceleration and may eventually impact Neptune's atmosphere, or break up into a planetary ring upon passing its Roche limit due to tidal stretching, similar to how Triton will crash into Neptune or break into a planetary ring.\n\nLarissa has only been visited by Voyager 2. The probe was able to get photographs of Larissa.",
                      wiki: "https://en.wikipedia.org/wiki/Larissa_(moon)",
                      nasa: "http://solarsystem.nasa.gov/planets/larissa")
        
        Neptune.moons.append(Larissa)
        
        let N1 = Moon(name: "S/2004 N 1",
                      position: 6)
        
        N1.about(description: "S/2004 N 1 is a small moon of Neptune, about 18 km (11 mi) in diameter, which orbits the planet in just under one Earth day. Its discovery on 1 July 2013 increased Neptune's retinue of known satellites to fourteen. The moon is so dim that it was not observed when Voyager 2 flew by in 1989. Mark Showalter of the SETI Institute found it by analyzing archived Neptune photographs the Hubble Space Telescope captured between 2004 and 2009.\n\nThe designation \"S/2004 N 1\" is provisional; \"2004\" refers to the year the data was first acquired, not the year of discovery.",
                 wiki: "https://en.wikipedia.org/wiki/S/2004_N_1",
                 nasa: "http://solarsystem.nasa.gov/planets/s2004n1")
        
        Neptune.moons.append(N1)
        
        let Proteus = Moon(name: "Proteus",
                           position: 7)
        
        Proteus.about(description: "Proteus, also known as Neptune VIII, is the second largest Neptunian moon, and Neptune's largest inner satellite. Discovered by Voyager 2 spacecraft in 1989, it is named after Proteus, the shape-changing sea god of Greek mythology. Proteus orbits Neptune in a nearly equatorial orbit at the distance of about 4.75 equatorial radii of the planet.\n\nDespite being a predominantly icy body more than 400 km in diameter, Proteus's shape deviates significantly from an ellipsoid. It is shaped more like an irregular polyhedron with several slightly concave facets and relief as high as 20 km. Its surface is dark, neutral in color, and heavily cratered. Proteus's largest crater is Pharos, which is more than 230 km in diameter. There are also a number of scarps, grooves, and valleys related to large craters.\n\nProteus is probably not an original body that formed with Neptune; it may have accreted later from the debris created when the largest Neptunian satellite Triton was captured.",
                      wiki: "https://en.wikipedia.org/wiki/Proteus_(moon)",
                      nasa: "http://solarsystem.nasa.gov/planets/proteus")
        
//        Proteus.display(texture: nil,
//                        model: "proteus.dae",
//                        normalmap: nil)
        
        Neptune.moons.append(Proteus)
        
        let Triton = Moon(name: "Triton",
                          position: 8)
        
        Triton.about(description: "Triton is the largest natural satellite of the planet Neptune. It was discovered on October 10, 1846, by English astronomer William Lassell. It is the only large moon in the Solar System with a retrograde orbit, an orbit in the opposite direction to its planet's rotation. At 2,700 kilometres (1,700 mi) in diameter, it is the seventh-largest moon in the Solar System. Because of its retrograde orbit and composition similar to Pluto's, Triton is thought to have been a dwarf planet captured from the Kuiper belt. Triton has a surface of mostly frozen nitrogen, a mostly water-ice crust, an icy mantle and a substantial core of rock and metal. The core makes up two-thirds of its total mass. Triton has a mean density of 2.061 g/cm3 and is composed of approximately 15–35% water ice.\n\nTriton is one of the few moons in the Solar System known to be geologically active (the others being Jupiter's Io and Saturn's Enceladus). As a consequence, its surface is relatively young with sparse impact craters, and a complex geological history revealed in intricate cryovolcanic and tectonic terrains. Part of its surface has geysers erupting sublimated nitrogen gas, contributing to a tenuous nitrogen atmosphere less than 1/70,000 the pressure of Earth's atmosphere at sea level.",
                     wiki: "https://en.wikipedia.org/wiki/Triton_(moon)",
                     nasa: "http://solarsystem.nasa.gov/planets/triton")
        Triton.display(texture: "tritonmap.jpg",
                       model: nil,
                       normalmap: nil)
        
        Neptune.moons.append(Triton)
        
        let Nereid = Moon(name: "Nereid",
                          position: 9)
        
        Nereid.about(description: "Nereid is the third-largest moon of Neptune. It has a highly eccentric orbit. It was the second moon of Neptune to be discovered, by Gerard Kuiper in 1949.\n\nNereid was discovered on 1 May 1949 by Gerard P. Kuiper on photographic plates taken with the 82-inch telescope at the McDonald Observatory. He proposed the name in the report of his discovery. It is named after the Nereids, sea-nymphs of Greek mythology and attendants of the god Neptune. It was the second and last moon of Neptune to be discovered before the arrival of Voyager 2 (not counting a single observation of an occultation by Larissa in 1981).\n\nNereid orbits Neptune in the prograde direction at an average distance of 5,513,400 km (3,425,900 mi), but its high eccentricity of 0.7507 takes it as close as 1,372,000 km (853,000 mi) and as far as 9,655,000 km (5,999,000 mi).\n\nThe unusual orbit suggests that it may be either a captured asteroid or Kuiper belt object, or that it was an inner moon in the past and was perturbed during the capture of Neptune's largest moon Triton.\n\nSince 1987 some photometric observations of Nereid have detected large (by ~1 of magnitude) variations of it brightness, which can happen over years and months, but sometimes even over a few days. They persist even after a correction for distance and phase effects. On the other hand, not all astronomers who have observed Nereid have noticed such variations. This means that they may be quite chaotic. To date there is no credible explanation of the variations, but, if they exist, they are likely related to the rotation of Nereid. Nereid's rotation can be either in the state of forced precession or even chaotic rotation (like Hyperion) due to its highly elliptical orbit. In any case its rotation should be rather irregular.",
                     wiki: "https://en.wikipedia.org/wiki/Nereid_(moon)",
                     nasa: "http://solarsystem.nasa.gov/planets/nereid")
        
        Neptune.moons.append(Nereid)
        
        let Halimede = Moon(name: "Halimede",
                            position: 10)
        
        Halimede.about(description: "Halimede, or Neptune IX, is a retrograde irregular satellite of Neptune. It was discovered by Matthew J. Holman, John J. Kavelaars, Tommy Grav, Wesley C. Fraser and Dan Milisavljevic on August 14, 2002.\n\nHalimede has the second most eccentric and third most inclined orbit around Neptune. This is illustrated on the diagram in relation to other irregular satellites of Neptune. The satellites above the horizontal axis are prograde, the satellites beneath it are retrograde. The yellow segments extend from the pericentre to the apocentre, showing the eccentricity.\n\nHalimede is about 62 kilometers in diameter (assuming an albedo of 0.04) and appears neutral (grey) in the visible light. Given the very similar colour of the satellite to that of Nereid together with the high probability (41%) of collision in the past lifespan of the Solar System, it has been suggested that the satellite could be a fragment of Nereid.\n\nHalimede like many of the outer satellites of Neptune, is named after one of the Nereids, the fifty daughters of Nereus and Doris. Before the announcement of its name on February 3, 2007 (IAUC 8802), Halimede was known by the provisional designation S/2002 N 1.",
                       wiki: "https://en.wikipedia.org/wiki/Halimede_(moon)",
                       nasa: "http://solarsystem.nasa.gov/planets/halimede")
        
        Neptune.moons.append(Halimede)
        
        let Sao = Moon(name: "Sao",
                       position: 11)
        
        Sao.about(description: "Sao is a prograde irregular satellite of Neptune. It was discovered by Matthew J. Holman et al. on August 14, 2002.\n\nSao orbits Neptune at a distance of about 22.4 million km and is about 44 kilometers in diameter (assuming an albedo of 0.04).\n\nSao follows an exceptionally inclined and moderately eccentric orbit illustrated on the diagram in relation to other irregular satellites of Neptune. The satellites above the horizontal axis are prograde, the satellites beneath it are retrograde. The yellow segments extend from the pericentre to the apocentre, showing the eccentricity.\n\nThe satellite is in Kozai resonance, i.e. its inclination and eccentricity are coupled (the inclination of the orbit decreases while eccentricity increases and vice versa).\n\nSao, or Neptune XI, like many of the outer satellites of Neptune, is named after one of the Nereids; Sao was associated with sailing and is referred to as \"The rescuer\" or \"Safety\". Before the announcement of its name on February 3, 2007 (IAUC 8802), Sao was known provisionally as S/2002 N 2.",
                  wiki: "https://en.wikipedia.org/wiki/Sao_(moon)",
                  nasa: "http://solarsystem.nasa.gov/planets/sao")
        
        Neptune.moons.append(Sao)
        
        let Laomedeia = Moon(name: "Laomedeia",
                             position: 12)
        
        Laomedeia.about(description: "Laomedeia, also known as Neptune XII, is a prograde irregular satellite of Neptune. It was discovered by Matthew J. Holman, et al. on August 13, 2002. Before the announcement of its name on February 3, 2007 (IAUC 8802), it was known as S/2002 N 3.\n\nIt orbits Neptune at a distance of about 23,571,000 km and is about 42 kilometers in diameter (assuming albedo of 0.04). It is named after Laomedeia, one of the 50 Nereids.",
                        wiki: "https://en.wikipedia.org/wiki/Laomedeia",
                        nasa: "http://solarsystem.nasa.gov/planets/laomedeia")
        
        Neptune.moons.append(Laomedeia)
        
        let Psamathe = Moon(name: "Psamathe",
                            position: 13)
        
        Psamathe.about(description: "Psamathe, also known as Neptune X, is a retrograde irregular satellite of Neptune. It is named after Psamathe, one of the Nereids. Psamathe was discovered by Scott S. Sheppard and David C. Jewitt in 2003 using the 8.2 meter Subaru telescope. Before the announcement of its name on February 3, 2007 (IAUC 8802), it was known by the provisional designation S/2003 N 1.\n\nPsamathe is about 38 kilometers in diameter. It orbits Neptune at a distance of between 25.7 and 67.7 million km (for comparison, the Sun-Mercury distance varies between 46 million and 69.8 million km) and requires almost 25 Earth years to make one orbit. The orbit of this satellite is close to the theoretical stable separation from Neptune for a body in a retrograde orbit. Given the similarity of Psamathe's orbital parameters with Neso (S/2002 N 4), it was suggested that both irregular satellites could have a common origin in the break-up of a larger moon. Both are further from their primary than any other known moon in the Solar System.",
                       wiki: "https://en.wikipedia.org/wiki/Psamathe_(moon)",
                       nasa: "http://solarsystem.nasa.gov/planets/psamathe")
        
        Neptune.moons.append(Psamathe)
        
        let Neso = Moon(name: "Neso",
                        position: 14)
        
        Neso.about(description: "Neso, also known as Neptune XIII, is the outermost natural satellite of Neptune. It is an Irregular moon discovered by Matthew J. Holman, Brett J. Gladman, et al. on August 14, 2002, though it went unnoticed until 2003. Neso orbits Neptune at a distance of more than 48 Gm (million km), making it (as of 2015) the most distant known moon of any planet. At apocenter, the satellite is more than 72 Gm from Neptune. This distance is of such an order that it exceeds Mercury's aphelion, which is approximately 70 Gm from the Sun.\n\nNeso is also the moon with the longest orbital period, 26.67 years. It follows a highly inclined and highly eccentric orbit illustrated on the diagram in relation to other irregular satellites of Neptune. The satellites above the horizontal axis are prograde, the satellites beneath it are retrograde. The yellow segments extend from the pericentre to the apocentre, showing the eccentricity.\n\nNeso is about 60 km (37 mi) in diameter based on an assumed albedo, and assuming a mean density of 1.5 g/cm3, its mass is estimated at 2×1017 kg.\n\nGiven the similarity of the orbit's parameters with Psamathe (S/2003 N 1), it was suggested that both irregular satellites could have a common origin in the break-up of a larger moon.\n\nNeso is named after one of the Nereids. Before the announcement of its name on February 3, 2007 (IAUC 8802), Neso was known by its provisional designation, S/2002 N 4.",
                   wiki: "https://en.wikipedia.org/wiki/Neso_(moon)",
                   nasa: "http://solarsystem.nasa.gov/planets/neso")
        
        Neptune.moons.append(Neso)
        
        //----------------------------------------------------------------------------------------------
        let Ceres = Planet(name: "Ceres",
                           type: Type.Rock,
                           position: 1,
                           classification: Class.Dwarf)
        
        Ceres.about(description: "Ceres is the largest object in the asteroid belt that lies between the orbits of Mars and Jupiter. Its diameter is approximately 945 kilometers (587 miles), making it the largest of the minor planets within the orbit of Neptune. The 33rd-largest known body in the Solar System, it is the only dwarf planet within the orbit of Neptune. Composed of rock and ice, Ceres is estimated to compose approximately one third of the mass of the entire asteroid belt. Ceres is the only object in the asteroid belt known to be rounded by its own gravity (though detailed analysis was required to exclude 4 Vesta). From Earth, the apparent magnitude of Ceres ranges from 6.7 to 9.3, and hence even at its brightest, it is too dim to be seen with the naked eye, except under extremely dark skies.\n\nCeres was the first asteroid discovered, by Giuseppe Piazzi at Palermo on 1 January 1801. It was originally considered a planet, but was reclassified as an asteroid in the 1850s after many other objects in similar orbits were discovered.\n\nCeres appears to be differentiated into a rocky core and icy mantle, and may have a remnant internal ocean of liquid water under the layer of ice. The surface is probably a mixture of water ice and various hydrated minerals such as carbonates and clay. In January 2014, emissions of water vapor were detected from several regions of Ceres. This was unexpected, because large bodies in the asteroid belt typically do not emit vapor, a hallmark of comets.\n\nThe robotic NASA spacecraft Dawn entered orbit around Ceres on 6 March 2015. Pictures with a resolution previously unattained were taken during imaging sessions starting in January 2015 as Dawn approached Ceres, showing a cratered surface. Two distinct bright spots (or high-albedo features) inside a crater (different from the bright spots observed in earlier Hubble images) were seen in a 19 February 2015 image, leading to speculation about a possible cryovolcanic origin or outgassing. On 3 March 2015, a NASA spokesperson said the spots are consistent with highly reflective materials containing ice or salts, but that cryovolcanism is unlikely, however on 2 September 2016, published alongside six other studies, NASA scientists released a paper in Science that claims that a massive ice volcano called Ahuna Mons is the strongest evidence yet for the existence of these mysterious ice volcanoes. On 11 May 2015, NASA released a higher-resolution image showing that, instead of one or two spots, there are actually several. On 9 December 2015, NASA scientists reported that the bright spots on Ceres may be related to a type of salt, particularly a form of brine containing magnesium sulfate hexahydrite (MgSO4·6H2O); the spots were also found to be associated with ammonia-rich clays. In June 2016, near-infrared spectra of these bright areas were found to be consistent with a large amount of sodium carbonate (Na2CO3), implying that recent geologic activity was probably involved in the creation of the bright spots.\n\nIn October 2015, NASA released a true color portrait of Ceres made by Dawn. In February 2017, organics were reported to have been detected on Ceres in Ernutet crater.",
                    wiki: "https://en.wikipedia.org/wiki/Ceres_(dwarf_planet)",
                    nasa: "http://solarsystem.nasa.gov/planets/ceres")
        
        Ceres.display(texture: "ceresmap.png",
                      model: nil,
                      normalmap: "ceresnormalmap.png",
                      ringmap: nil,
                      ring_transparencymap: nil,
                      ring_inner_ratio: nil,
                      ring_outer_ratio: nil)
        
        Ceres.geology(mass: 947000000.petagram(),
                      volume: 452331448.kilometer(),
                      equatorial: 2992.1.kilometer(),
                      density: 2090.kilogram(),
                      gravity: 0.28.meter(),
                      escape_velocity: 0.5152778.kilometer(),
                      irradiance: nil,
                      geographic_height_variance: nil)
        
        Ceres.orbitals(year_length: 1681.63.day(),
                       perihelion: 382620000.kilometer(),
                       aphelion: 445410000.kilometer(),
                       velocity: 17.905.kilometer(),
                       inclination: 10.593,
                       eccentricity: 0.079138251,
                       day_length: 9.07417.hour(),
                       equator_inclination: 9.20,
                       min_distance_from_earth: nil,
                       max_distance_from_earth: nil)
        
        Ceres.misc(discovered: "January 1st, 1801")
        
        //----------------------------------------------------------------------------------------------
        let Pluto = Planet(name: "Pluto",
                           type: Type.Rock,
                           position: 2,
                           classification: Class.Dwarf)
        
        Pluto.about(description: "Pluto is a dwarf planet in the Kuiper belt, a ring of bodies beyond Neptune. It was the first Kuiper belt object to be discovered.\n\nPluto was discovered by Clyde Tombaugh in 1930 and was originally considered to be the ninth planet from the Sun. After 1992, its planethood was questioned following the discovery of several objects of similar size in the Kuiper belt. In 2005, Eris, which is 27% more massive than Pluto, was discovered. This led the International Astronomical Union (IAU) to define the term \"planet\" formally in 2006, during their 26th General Assembly. That definition excluded Pluto and reclassified it as a dwarf planet.\n\nPluto is the largest and second-most-massive known dwarf planet in the Solar System and the ninth-largest and tenth-most-massive known object directly orbiting the Sun. It is the largest known trans-Neptunian object by volume but is less massive than Eris, a dwarf planet in the scattered disc. Like other Kuiper belt objects, Pluto is primarily made of ice and rock and is relatively small—about one-sixth the mass of the Moon and one-third its volume. It has a moderately eccentric and inclined orbit during which it ranges from 30 to 49 astronomical units or AU (4.4–7.4 billion km) from the Sun. This means that Pluto periodically comes closer to the Sun than Neptune, but a stable orbital resonance with Neptune prevents them from colliding. Light from the Sun takes about 5.5 hours to reach Pluto at its average distance (39.5 AU).\n\nPluto has five known moons: Charon (the largest, with a diameter just over half that of Pluto), Styx, Nix, Kerberos, and Hydra. Pluto and Charon are sometimes considered a binary system because the barycenter of their orbits does not lie within either body. The IAU has not formalized a definition for binary dwarf planets, and Charon is officially classified as a moon of Pluto.\n\nIn September 2016, astronomers announced that the reddish-brown cap of the north pole of Charon is composed of tholins, organic macromolecules that may be ingredients for the emergence of life, and produced from methane, nitrogen and related gases released from the atmosphere of Pluto and transferred over about 19,000 km (12,000 mi) distance to the orbiting moon.\n\nOn July 14, 2015, the New Horizons spacecraft became the first spacecraft to fly by Pluto. During its brief flyby, New Horizons made detailed measurements and observations of Pluto and its moons. On October 25, 2016, at 05:48 pm ET, the last bit of data (of a total of 50 billion bits of data; or 6.25 gigabytes) was received from New Horizons from its close encounter with Pluto on July 14, 2015.",
                    wiki: "https://en.wikipedia.org/wiki/Pluto",
                    nasa: "http://solarsystem.nasa.gov/planets/pluto")
        
        Pluto.display(texture: "plutomap.jpg",
                      model: nil,
                      normalmap: nil,
                      ringmap: nil,
                      ring_transparencymap: nil,
                      ring_inner_ratio: nil,
                      ring_outer_ratio: nil)
        
        Pluto.geology(mass: 130300000.exogram(),
                      volume: 6970000.megameter(),
                      equatorial: 1187.kilometer(),
                      density: 1860.kilogram(),
                      gravity: 0.62.meter(),
                      escape_velocity: 1.21.kilometer(),
                      irradiance: 0.873,
                      geographic_height_variance: nil)
        
        Pluto.orbitals(year_length: 90560.day(),
                       perihelion: 4436820.megameter(),
                       aphelion: 7375930.megameter(),
                       velocity: 4.67.kilometer(),
                       inclination: 17.16,
                       eccentricity: 0.2488,
                       day_length: 153.282.hour(),
                       equator_inclination: 57.47,
                       min_distance_from_earth: 4284700.megameter(),
                       max_distance_from_earth: 7528000.megameter())
        
        Pluto.atmosphere(surface_pressure: 0.0000001,
                         average_temperature: 50,
                         total_mass: nil)
        
        Pluto.misc(discovered: "Febuary 18th, 1930")
        
        let Charon = Moon(name: "Charon",
                          position: 1)
        
        Charon.about(description: "Charon, also known as (134340) Pluto I, is the largest of the five known natural satellites of the dwarf planet Pluto. It was discovered in 1978 at the United States Naval Observatory in Washington, D.C., using photographic plates taken at the United States Naval Observatory Flagstaff Station (NOFS). With half the diameter and one eighth the mass of Pluto, it is a very large moon in comparison to its parent body. Its gravitational influence is such that the barycenter of the Pluto–Charon system lies outside Pluto. In September 2016, astronomers announced that the reddish-brown cap of the north pole of Charon is composed of tholins, organic macromolecules that may be essential ingredients of life, and produced from methane, nitrogen and related gases released from the atmosphere of Pluto and transferred over about 19,000 km (12,000 mi) distance to the orbiting moon. The New Horizons spacecraft is the only probe that has visited the Pluto system. It approached Charon to within 27,000 km (17,000 mi).",
                     wiki: "https://en.wikipedia.org/wiki/Charon_(moon)",
                     nasa: "http://solarsystem.nasa.gov/planets/charon")
        
        Charon.display(texture: "charonmap.jpg",
                       model: nil,
                       normalmap: nil)
        
        Pluto.moons.append(Charon)
        
        let Styx = Moon(name: "Styx",
                        position: 2)
        
        Styx.about(description: "Styx is a small natural satellite of Pluto whose discovery was announced on 11 July 2012. It was imaged along with Pluto and Pluto's other moons by the New Horizons spacecraft in July 2015. A single image was returned.\n\nStyx is the second satellite of Pluto by distance and the fifth discovered. It was discovered one year after Kerberos. Styx is approximately 13 × 8 km across, and its orbital period is 20.2 days.The survey work leading to the discovery of Styx was in preparation for the mission of the unmanned New Horizons spaceprobe, which flew by the Pluto system on 14 July 2015. The discovery of another small Plutonian moon heightened concerns that this region of space may harbor more bodies too small to be detected, and that the probe could be damaged by an uncharted body or ring as it traversed the system at a speed of over 13 km/s; tiny moons, such as Saturn's moon Pallene, tend to be associated with tenuous rings or arcs, because their gravity is unable to hold on to material ejected by meteoroid impacts; such diffuse material represents the chief navigational hazard. However, the New Horizons probe did not detect any smaller moons or rings, and passed through the Pluto system safely.\n\nThe unexpectedly complex moon system around Pluto may be the result of a collision between Pluto and another sizable Kuiper belt object in the distant past. Pluto's moons may have coalesced from the debris from such an event, similar to the early giant impact thought to have created the Moon. The orbital resonances may have acted as \"ruts\" to gather material from the smashup.",
                   wiki: "https://en.wikipedia.org/wiki/Styx_(moon)",
                   nasa: "http://solarsystem.nasa.gov/planets/styx")
        
        Pluto.moons.append(Styx)
        
        let Nix = Moon(name: "Nix",
                       position: 3)
        
        Nix.about(description: "Nix is a natural satellite of Pluto. It was discovered along with Hydra (Pluto's outermost satellite) in June 2005. It was imaged along with Pluto and its other moons by the New Horizons spacecraft as it flew by the Pluto system in July 2015. Of the four small Plutonian moons the best pictures are of Nix, with resolutions as high as 330 meters per pixel.\n\nNix follows a circular orbit in the same plane as Charon. It is in a 3:2 orbital resonance with Hydra, and a 9:11 resonance with Styx (the ratios represent numbers of orbits completed per unit time; the period ratios are the inverses). As a result of this \"Laplace-like\" 3-body resonance, it has conjunctions with Styx and Hydra in a 2:3 ratio.\n\nAs with Hydra and perhaps the other small Plutonian moons, Nix tumbles chaotically; the moon's axial tilt and day length vary greatly over short timescales. At the time of New Horizon's flyby, Nix was rotating with a period of 43.9 hours retrograde to Pluto's equator with an inclination of 132 degrees — in other words it is rotating \"backwards\" in relation to its orbit around Pluto. The rotation period has actually increased by 10% since Nix was discovered.\n\nNix has been measured to be 54 by 41 by 36 kilometers (33.6 mi × 25.5 mi × 22.4 mi) in diameter, indicating a very elongated shape, and a very high geometric albedo. In the discovery image, Nix is 6,300 times fainter than Pluto. New Horizons determined that Nix is approximately 32 kilometers (20 mi) across.\n\nEarly research appeared to show that Nix was reddish like Pluto and unlike the other moons, but more-recent reports have been that it is grey like the remaining satellites. New Horizons spotted a large region with a distinctive red tint surrounding a large crater, which may explain these conflicting results. Detailed images of the moon have revealed at least 6 impact craters on it, the largest of which is about 15 km across.",
                  wiki: "https://en.wikipedia.org/wiki/Nix_(moon)",
                  nasa: "http://solarsystem.nasa.gov/planets/nix")
        
        Pluto.moons.append(Nix)
        
        let Kerberos = Moon(name: "Kerberos",
                            position: 4)
        
        Kerberos.about(description: "Kerberos is a small natural satellite of Pluto, about 12 km (7.5 mi) in its longest dimension. It was the fourth moon of Pluto to be discovered and its existence was announced on 20 July 2011. It was imaged, along with Pluto and its four other moons, by the New Horizons spacecraft in July 2015. The first image of Kerberos was released to the public on 22 October 2015.\n\nKerberos has a double-lobed shape and is approximately 7.4 mi (11.9 km) across in its long dimension and 2.8 mi (4.5 km) in its shortest dimension. Kerberos has an albedo similar to the other three small moons. Until the New Horizons flyby it was thought that Kerberos was larger and darker. Like the other small Plutonian satellites, Kerberos is not tidally locked; its current rotational period is about 5.33 days, although this varies quickly over geological timescales.\n\nObservations indicate a circular, equatorial orbit with a radius of approximately 58,000 km (36,000 mi). Kerberos orbits between Nix and Hydra and makes a complete orbit around Pluto roughly every 32.1 days. This period is close to a 1:5 orbital resonance with Charon, with the timing discrepancy being about 0.7%. As with the near resonances between Nix or Hydra and Charon (1:4 and 1:6, respectively), determining how close this relationship is to a true resonance will require more-accurate knowledge of Kerberos's orbit, in particular its rate of precession.\n\nLike Pluto's other satellites, it is suspected that Kerberos coalesced from the debris of a massive collision between Pluto and another Kuiper belt object, similar to the giant impact thought to have created the Moon.",
                       wiki: "https://en.wikipedia.org/wiki/Kerberos_(moon)",
                       nasa: "http://solarsystem.nasa.gov/planets/kerberos")
        
        Pluto.moons.append(Kerberos)
        
        let Hydra = Moon(name: "Hydra",
                         position: 5)
        
        Hydra.about(description: "Hydra is the outermost known moon of Pluto. It was discovered along with Nix in June 2005, and was visited along with Pluto by New Horizons in July 2015. Hydra's surface is probably covered with water ice. Observed within Hydra's bright regions is a darker circular structure with a diameter of approximately 10 kilometers (5 miles). Hydra's reflectivity (the percentage of incident light reflected from the surface) is intermediate between those of Pluto and Charon.\n\nIts orbital period of 38.2 days is also close to a 1:6 orbital resonance with Charon, with the timing discrepancy being 0.3%. A hypothesis to explain the near-resonance is that it originated before the outward migration of Charon following the formation of all five known moons, and is maintained by the periodic local fluctuation of 5% in the Pluto–Charon gravitational field strength.\n\nLike Saturn's moon Hyperion, Nix, and the other small moons of Pluto, Hydra rotates chaotically; its day length and rotational axis vary quickly over astronomical timescales, to the point that it regularly flips over. This is largely due to the aforementioned fluctuation of the Pluto–Charon gravitational field, as well as its irregular shape. Hydra's current rotational period is a mere 10 hours.\n\nHydra is irregular in shape, 55 by 40 kilometers (34.2 mi × 24.9 mi) in cross-section from one side. It is spectrally neutral like Charon and most of Nix (whereas Pluto is reddish) and is composed primarily of water ice, probably ice XI.",
                    wiki: "https://en.wikipedia.org/wiki/Hydra_(moon)",
                    nasa: "http://solarsystem.nasa.gov/planets/hydra")
        
        Pluto.moons.append(Hydra)
        
        //----------------------------------------------------------------------------------------------
        let Haumea = Planet(name: "Haumea",
                            type: Type.Rock,
                            position: 3,
                            classification: Class.Dwarf)
        
        Haumea.about(description: "Haumea, minor-planet designation 136108 Haumea, is a dwarf planet located beyond Neptune's orbit. It was discovered in 2004 by a team headed by Mike Brown of Caltech at the Palomar Observatory in the United States and independently in 2005, by a team headed by José Luis Ortiz Moreno at the Sierra Nevada Observatory in Spain, though the latter claim has been contested. On September 17, 2008, it was recognized as a dwarf planet by the International Astronomical Union (IAU) and named after Haumea, the Hawaiian goddess of childbirth.\n\nHaumea's mass is about one-third that of Pluto, and 1/1400 that of Earth. Although its shape has not been directly observed, calculations from its light curve indicate that it is a triaxial ellipsoid, with its major axis twice as long as its minor. Its gravity is thought to be sufficient for it to have relaxed into hydrostatic equilibrium, making it a dwarf planet. Haumea's elongated shape together with its rapid rotation, high density, and high albedo (from a surface of crystalline water ice), are thought to be the consequences of a giant collision, which left Haumea the largest member of a collisional family that includes several large trans-Neptunian objects (TNOs) and Haumea's two known moons, Hiʻiaka and Namaka.",
                     wiki: "https://en.wikipedia.org/wiki/Haumea",
                     nasa: "http://solarsystem.nasa.gov/planets/haumea")
        
        Haumea.geology(mass: 4006000.exogram(),
                       volume: 150000000.kilometer(),
                       equatorial: 690.kilometer(),
                       density: 2600.kilogram(),
                       gravity: 0.63.meter(),
                       escape_velocity: 0.91.kilometer(),
                       irradiance: nil,
                       geographic_height_variance: nil)
        
        Haumea.orbitals(year_length: 103774.day(),
                        perihelion: 5228745.megameter(),
                        aphelion: 7701747.megameter(),
                        velocity: (16191/60/60).kilometer(),
                        inclination: 28.19,
                        eccentricity: 0.198132061,
                        day_length: 3.9154.hour(),
                        equator_inclination: nil,
                        min_distance_from_earth: nil,
                        max_distance_from_earth: nil)
        
        Haumea.atmosphere(surface_pressure: nil,
                          average_temperature: 50,
                          total_mass: nil)
        
        Haumea.misc(discovered: "December 28th, 2004")
        
        let Namaka = Moon(name: "Namaka",
                          position: 1)
        
        Namaka.about(description: "Namaka is the smaller, inner moon of the dwarf planet Haumea. It is named after Nāmaka, the goddess of the sea in Hawaiian mythology and one of the daughters of Haumea.\n\nNamaka was discovered on 30 June 2005 and announced on 29 November 2005. It was nicknamed \"Blitzen\" by the discovery team being assigned an official name.\n\nNamaka is only 1.5% as bright as its parent dwarf planet Haumea and is about 0.05% its mass. If it turns out to have a similar albedo, it would be about 170 km in diameter. Photometric observations indicate that its surface is made of water ice.",
                     wiki: "https://en.wikipedia.org/wiki/Moons_of_Haumea#Namaka",
                     nasa: "http://solarsystem.nasa.gov/planets/haumea/moons")
        
        Haumea.moons.append(Namaka)
        
        let Hiiaka = Moon(name: "Hi'iaka",
                          position: 2)
        
        Hiiaka.about(description: "Hiʻiaka is the larger, outer moon of the dwarf planet Haumea.\n\nHiʻiaka was the first satellite discovered around Haumea. It is named after one of the daughters of Haumea, Hiʻiaka, the patron goddess of the Big Island of Hawaii, though at first it had gone by the nickname \"Rudolph\" by its discovery team. It orbits once every 49.12±0.03 d at a distance of 49880±198 km, with an eccentricity of 0.0513±0.0078 and an inclination of 126.356±0.064°. Mutual events expected in July 2009 should improve the knowledge of the orbits and masses of the components of the Haumean system.\n\nIts measured brightness is 5.9±0.5%, translating into a diameter of about 22% of its primary, or in the range of 320 km, assuming similar albedo. To put this in perspective, this would make it larger than all but four of the asteroids, after 1 Ceres, 2 Pallas, 4 Vesta, and 10 Hygiea. In spite of its relatively large size, however, lightcurve studies suggest that Hi'iaka is not a gravitationally collapsed spheroid; they further suggest that Hi'iaka is not tidally locked and has a rotation period of about 9.8 hours.\n\nThe mass of Hiʻiaka is estimated to be (1.79±0.11)×1019 kg using precise relative astrometry from Hubble Telescope and Keck Telescope and applying 3-body, point-mass model to the Haumean system.\n\nThe near infrared spectrum of Hiʻiaka is dominated by water-ice absorption bands, which means that its surface is made mainly of water ice. The presence of the band centered at 1.65 µm indicates that the surface water ice is primarily in the crystalline form. Currently it is unclear why water ice on the surface has not turned into amorphous form as would be expected due to its constant irradiation by cosmic rays.",
                     wiki: "https://en.wikipedia.org/wiki/Moons_of_Haumea#Hi.CA.BBiaka",
                     nasa: "http://solarsystem.nasa.gov/planets/haumea/moons")
        
        Haumea.moons.append(Hiiaka)
        
        //----------------------------------------------------------------------------------------------
        let Makemake = Planet(name: "Makemake",
                              type: Type.Rock,
                              position: 4,
                              classification: Class.Dwarf)
        
        Makemake.about(description: "Makemake (minor-planet designation 136472 Makemake) is a dwarf planet and perhaps the largest Kuiper belt object (KBO) in the classical population, with a diameter approximately two thirds that of Pluto. Makemake has one known satellite, S/2015 (136472) 1. Makemake’s extremely low average temperature, about 30 K (−243.2 °C), means its surface is covered with methane, ethane, and possibly nitrogen ices.\n\nMakemake was discovered on March 31, 2005, by a team led by Michael E. Brown, and announced on July 29, 2005. Initially, it was known as 2005 FY9 and later given the minor-planet number 136472. Makemake was recognized as a dwarf planet by the International Astronomical Union (IAU) in July 2008. Its name derives from Makemake in the mythology of the Rapa Nui people of Easter Island.",
                       wiki: "https://en.wikipedia.org/wiki/Makemake",
                       nasa: "http://solarsystem.nasa.gov/planets/makemake")
        
        Makemake.geology(mass: 4400000.exogram(),
                         volume: 1700000000.kilometer(),
                         equatorial: 739.kilometer(),
                         density: 1400.kilogram(),
                         gravity: nil,
                         escape_velocity: nil,
                         irradiance: nil,
                         geographic_height_variance: nil)
        
        Makemake.orbitals(year_length: 112897.day(),
                          perihelion: 5772980.megameter(),
                          aphelion: 7904750.megameter(),
                          velocity: 4.419.kilometer(),
                          inclination: 29.00685,
                          eccentricity: 0.15586,
                          day_length: 7.771.hour(),
                          equator_inclination: nil,
                          min_distance_from_earth: nil,
                          max_distance_from_earth: nil)
        
        Makemake.atmosphere(surface_pressure: nil,
                            average_temperature: 36,
                            total_mass: nil)
        
        Makemake.misc(discovered: "March 31st, 2005")
        
        let MK2 = Moon(name: "MK 2",
                       position: 1)
        
        MK2.about(description: "S/2015 (136472) 1, nicknamed MK 2 by the discovery team, is the only known moon of the dwarf planet Makemake. It is estimated to be 175 km (110 mi) km in diameter and has a semi-major axis at least 21,000 km (13,000 mi) from Makemake. Observations leading to its discovery occurred in April 2015, using the Hubble Space Telescope's Wide Field Camera 3 and its discovery was announced on 26 April 2016.\n\nOn 26 April 2016, astronomers using observations from the Hubble Space Telescope taken in April 2015 announced the discovery of a moon with a diameter of ~175 km (for an assumed albedo of 4%) orbiting Makemake at a distance of ≥ 21,000 km with a period of ≥ 12 days (the minimum values are those for a circular orbit; the actual orbital eccentricity is unknown). It was given the provisional name S/2015 (136472) 1.\n\nMost other large trans-Neptunian objects have at least one satellite: Eris has one, Haumea has two, Pluto has five, and 2007 OR10 has one satellite. 10% to 20% of all trans-Neptunian objects are expected to have one or more satellites. Because satellites offer a simple method to measure an object's mass, Makemake's satellite should lead to better estimates of its mass.",
                  wiki: "https://en.wikipedia.org/wiki/Makemake#Satellite",
                  nasa: "http://solarsystem.nasa.gov/planets/makemake/indepth")
        
        Makemake.moons.append(MK2)
        
        //----------------------------------------------------------------------------------------------
        let Eris = Planet(name: "Eris",
                          type: Type.Rock,
                          position: 4,
                          classification: Class.Dwarf)
        
        Eris.about(description: "Eris is the most massive and second-largest dwarf planet known in the Solar System. It is also the ninth-most-massive known body directly orbiting the Sun, and the largest known body in the Solar System not visited by a spacecraft. It is measured to be 2,326 ± 12 kilometers (1,445.3 ± 7.5 mi) in diameter. Eris is 27% more massive than dwarf planet Pluto, though Pluto is slightly larger by volume. Eris' mass is about 0.27% of the Earth's mass.\n\nEris was discovered in January 2005 by a Palomar Observatory-based team led by Mike Brown, and its identity was verified later that year. It is a trans-Neptunian object (TNO) and a member of a high-eccentricity population known as the scattered disk. It has one known moon, Dysnomia. As of February 2016, its distance from the Sun is 96.3 astronomical units (1.441×1010 km; 8.95×109 mi), roughly three times that of Pluto. With the exception of some comets, Eris and Dysnomia are currently the second-most-distant known natural objects in the Solar System, the farthest object being V774104 discovered in November 2015 at 103 AU.\n\nBecause Eris appeared to be larger than Pluto, NASA initially described it as the Solar System's tenth planet. This, along with the prospect of other objects of similar size being discovered in the future, motivated the International Astronomical Union (IAU) to define the term planet for the first time. Under the IAU definition approved on August 24, 2006, Eris is a \"dwarf planet\", along with objects such as Pluto, Ceres, Haumea and Makemake, thereby reducing the number of known planets in the Solar System to eight, the same as before Pluto's discovery in 1930. Observations of a stellar occultation by Eris in 2010 showed that its diameter was 2,326 ± 12 kilometers (1,445.3 ± 7.5 mi), not significantly different from that of Pluto. After New Horizons measured Pluto's diameter as 2372±4 km in July 2015, it was determined that Eris is slightly smaller in diameter than Pluto.",
                   wiki: "https://en.wikipedia.org/wiki/Eris_(dwarf_planet)",
                   nasa: "http://solarsystem.nasa.gov/planets/eris")
        
        Eris.geology(mass: 16600000.exogram(),
                     volume: 6590000.megameter(),
                     equatorial: 1163.kilometer(),
                     density: 2520.kilogram(),
                     gravity: 0.82.meter(),
                     escape_velocity: 1.38.kilometer(),
                     irradiance: nil,
                     geographic_height_variance: nil)
        
        Eris.orbitals(year_length: 203830.day(),
                      perihelion: 5723000.megameter(),
                      aphelion: 1460200000.kilometer(),
                      velocity: 3.4338.kilometer(),
                      inclination: 44.0445,
                      eccentricity: 0.44068,
                      day_length: 25.9.hour(),
                      equator_inclination: nil,
                      min_distance_from_earth: nil,
                      max_distance_from_earth: nil)
        
        Eris.atmosphere(surface_pressure: nil,
                        average_temperature: 30,
                        total_mass: nil)
        
        Eris.misc(discovered: "January 5th, 2005")
        
        let Dysnomia = Moon(name: "Dysnomia",
                            position: 1)
        
        Dysnomia.about(description: "Dysnomia —officially (136199) Eris I Dysnomia— is the only known moon of the dwarf planet Eris (the most massive known dwarf planet in the Solar System). It was discovered in 2005 by Mike Brown and the laser guide star adaptive optics team at the W. M. Keck Observatory, and carried the provisional designation of S/2005 (2003 UB313) 1 until officially named Dysnomia (from the Ancient Greek word Δυσνομία meaning anarchy/lawlessness) after the daughter of the Greek goddess Eris.\n\nDysnomia was found 4.43 magnitudes fainter than Eris, and its diameter is estimated to be between 350 and 490 km, though Mike Brown claims that it is 500 times fainter and between 100 and 250 km in diameter. It is 60 times fainter than Eris in the K band and 480 times fainter in the V band, which means a very different, and quite redder, spectrum, indicating a significantly darker surface. Assuming its albedo is five times lower than Eris's, its diameter would be 685±50 km, meaning that Dysnomia is itself likely a rather large Trans-Neptunian object. Of the Solar System's dwarf planet and minor planet moons, only Charon is definitely larger than Dysnomia.\n\nAstronomers now know that the four brightest Kuiper belt objects (KBOs) have satellites. Among the fainter members of the belt only about 10% are known to have satellites. This is thought to imply that collisions between large KBOs have been frequent in the past. Impacts between bodies of the order of 1000 km across would throw off large amounts of material that would coalesce into a moon. A similar mechanism is thought to have led to the formation of the Moon when Earth was struck by a giant impactor early in the history of the Solar System.",
                       wiki: "https://en.wikipedia.org/wiki/Dysnomia_(moon)",
                       nasa: "http://solarsystem.nasa.gov/galleries/eris-and-dysnomia")
        
        Eris.moons.append(Dysnomia)
        
        //----------------------------------------------------------------------------------------------
        
        
        
        return [Class.Major: [Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune], Class.Dwarf: [Ceres, Pluto, Haumea, Makemake, Eris]]
    }
    
    static func itemsInSection(_ section: Int) -> Int {
        let objects = planets()
        let classification = Class.allValues[section]
        return objects[classification]!.count
    }
}
