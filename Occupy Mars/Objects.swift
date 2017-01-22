//
//  objects.swift
//  Occupy Mars
//
//  Created by Slaght, Brandon on 10/30/16.
//  Copyright © 2016 Slaght, Brandon. All rights reserved.
//

import Foundation

class Objects {
    
    static func planets() -> [Class: [Planet]] {
        
        //----------------------------------------------------------------------------------------------
        let Mercury = Planet(name: "Mercury", type: Type.Rock, position: 1, classification: Class.Major)
        
        Mercury.about(description: "Mercury is the smallest and innermost planet in the Solar System. Its orbital period (about 88 Earth days) is less than any other planet in the Solar System. Seen from Earth, it appears to move around its orbit in about 116 days. It has no known natural satellites. It is named after the Roman deity Mercury, the messenger to the gods.\n\nPartly because it has almost no atmosphere to retain heat, Mercury's surface temperature varies diurnally more than any other planet in the Solar System, ranging from 100 K (−173 °C; −280 °F) at night to 700 K (427 °C; 800 °F) during the day in some equatorial regions. The poles are constantly below 180 K (−93 °C; −136 °F). Mercury's axis has the smallest tilt of any of the Solar System's planets (about  1/30 degree), and its orbital eccentricity is the largest of all known planets in the Solar System. At aphelion, Mercury is about 1.5 times as far from the Sun as it is at perihelion. Mercury's surface is heavily cratered and similar in appearance to the Moon, indicating that it has been geologically inactive for billions of years.\n\nMercury is tidally or gravitationally locked with the Sun in a 3:2 resonance, and rotates in a way that is unique in the Solar System. As seen relative to the fixed stars, it rotates on its axis exactly three times for every two revolutions it makes around the Sun. As seen from the Sun, in a frame of reference that rotates with the orbital motion, it appears to rotate only once every two Mercurian years. An observer on Mercury would therefore see only one day every two years.\n\nBecause Mercury orbits the Sun within Earth's orbit (as does Venus), it can appear in Earth's sky in the morning or the evening, but not in the middle of the night. Also, like Venus and the Moon, it displays a complete range of phases as it moves around its orbit relative to Earth. Although Mercury can appear as a bright object when viewed from Earth, its proximity to the Sun makes it more difficult to see than Venus. Two spacecraft have visited Mercury: Mariner 10 flew by in 1974 and 1975; and MESSENGER, launched in 2004, orbited Mercury over 4,000 times in four years, before exhausting its fuel and crashing into the planet's surface on April 30, 2015.", wiki: "https://en.wikipedia.org/wiki/Mercury", nasa: "http://solarsystem.nasa.gov/planets/mercury")
        
        Mercury.geology(mass: 0.33011, volume: 6.083, equatorial: 2439.7, density: 5427, gravity: 3.70, escape_velocity: 4.3, irradiance: 9082.7, geographic_height_variance: 7)
        
        Mercury.orbitals(year_length: 87.968, perihelion: 46.00, aphelion: 69.82, velocity: 47.36, inclination: 7, eccentricity: 0.2056, day_length: 4222.6, equator_inclination: 0.034, min_distance_from_earth: 77.3, max_distance_from_earth: 221.9)
        
        Mercury.atmosphere(surface_pressure: 0.000000000000005, average_temperature: 440, total_mass: 10)
        
        Mercury.misc(discovered: "265 B.C.E.")
        
        Mercury.display(texture: "mercurymap.jpg", model: nil, normalmap: nil, ringmap: nil, ring_transparencymap: nil, ring_inner_ratio: nil, ring_outer_ratio: nil)
        
        Mercury.images(images: [
            ("mercury - hollows.jpg", "Hollows on the surface of Mercury as photographed by the Messenger spacecraft."),
            ("mercury - brahms.jpg", "Brahm's crater on Mercury, with a peak at the center caused by the shock of the impact."),
            ("mercury - horizon.jpg", "Mercury's horizon as seen by the Messenger spacecraft."),
            ("mercury - pole.jpg", "The north pole of Mercury.  The craters here never see sunlight and harbor frozen water."),
            ("mercury - transit.jpg", "Due to its orbital frequency and inclination, Mercury transists the sun far more often than Venus, an event which occurs every several years.")])
        
        
        //----------------------------------------------------------------------------------------------
        let Venus = Planet(name: "Venus", type: Type.Rock, position: 2, classification: Class.Major)
        
        Venus.about(description: "Venus is the second planet from the Sun, orbiting it every 224.7 Earth days. It has the longest rotation period (243 days) of any planet in the Solar System and rotates in the opposite direction to most other planets. It has no natural satellite. It is named after the Roman goddess of love and beauty. It is the second-brightest natural object in the night sky after the Moon, reaching an apparent magnitude of −4.6, bright enough to cast shadows. Because Venus orbits within Earth's orbit it is an inferior planet and never appears to venture far from the Sun; its maximum angular distance from the Sun (elongation) is 47.8°.\n\nVenus is a terrestrial planet and is sometimes called Earth's 'sister planet' because of their similar size, mass, proximity to the Sun, and bulk composition. It is radically different from Earth in other respects. It has the densest atmosphere of the four terrestrial planets, consisting of more than 96% carbon dioxide. The atmospheric pressure at the planet's surface is 92 times that of Earth, or roughly the pressure found 900 m (3,000 ft) underwater on Earth. Venus is by far the hottest planet in the Solar System, with a mean surface temperature of 735 K (462 °C; 863 °F), even though Mercury is closer to the Sun. Venus is shrouded by an opaque layer of highly reflective clouds of sulfuric acid, preventing its surface from being seen from space in visible light. It may have had water oceans in the past, but these would have vaporized as the temperature rose due to a runaway greenhouse effect. The water has probably photodissociated, and the free hydrogen has been swept into interplanetary space by the solar wind because of the lack of a planetary magnetic field. Venus's surface is a dry desertscape interspersed with slab-like rocks and is periodically resurfaced by volcanism.\n\nAs one of the brightest objects in the sky, Venus has been a major fixture in human culture for as long as records have existed. It has been made sacred to gods of many cultures, and has been a prime inspiration for writers and poets as the 'morning star' and 'evening star'. Venus was the first planet to have its motions plotted across the sky, as early as the second millennium BC, and was a prime target for early interplanetary exploration as the closest planet to Earth. It was the first planet beyond Earth visited by a spacecraft (Mariner 2) in 1962, and the first to be successfully landed on (by Venera 7) in 1970. Venus's thick clouds render observation of its surface impossible in visible light, and the first detailed maps did not emerge until the arrival of the Magellan orbiter in 1991. Plans have been proposed for rovers or more complex missions, but they are hindered by Venus's hostile surface conditions.", wiki: "https://en.wikipedia.org/wiki/Venus", nasa: "http://solarsystem.nasa.gov/planets/venus")
        
        Venus.geology(mass: 4.8675, volume: 92.843, equatorial: 6051.8, density: 5243, gravity: 8.87, escape_velocity: 10.36, irradiance: 2601.3, geographic_height_variance: 13)
       
        Venus.orbitals(year_length: 224.695, perihelion: 107.48, aphelion: 108.94, velocity: 35.02, inclination: 3.39, eccentricity: 0.0067, day_length: 2802.0, equator_inclination: 2.62, min_distance_from_earth: 38.2, max_distance_from_earth: 261.0)
        
        Venus.atmosphere(surface_pressure: 92000, average_temperature: 737, total_mass: 480000000000000000)
        
        Venus.misc(discovered: "Prehistoric Times")
        
        Venus.display(texture: "venusmap.jpg", model: nil, normalmap: "venusnormalmap.jpg", ringmap: nil, ring_transparencymap: nil, ring_inner_ratio: nil, ring_outer_ratio: nil)
        
        Venus.images(images: [
            ("venus - clouds.jpg", "Although similar in size to Earth, Venus is shrouded by a thick heavy armosphere, which drives surface temeratures past 800 degrees F."),
            ("venus - mountain.jpg", "The Mangellan probe made detailed 3d mappings of Venus using radar to see throught the clouds.  This 3km tall volcano is called Gula Mons."),
            ("venus - transit.jpg", "The transit of Venus happens around twice a century."),
            ("venus - venera13.jpg", "Soviet spacecraft were the first to reach the surface of Venus.  Venera 13 returned color images of the surface."),
            ("venus - venera14.jpg", "Probes sent to the surface only last a few hours due to the harsh conditions.  Here Venera 14 takes another picture of the surface.")])
        
        
        //----------------------------------------------------------------------------------------------
        let Earth = Planet(name: "Earth", type: Type.Rock, position: 3, classification: Class.Major)
        
        Earth.about(description: "Earth is the third planet from the Sun, the densest planet in the Solar System, the largest of the Solar System's four terrestrial planets, and the only astronomical object known to harbor life.\n\nAccording to radiometric dating and other sources of evidence, Earth formed about 4.54 billion years ago. Earth gravitationally interacts with other objects in space, especially the Sun and the Moon. During one orbit around the Sun, Earth rotates about its axis 366.26 times, creating 365.26 solar days or one sidereal year. Earth's axis of rotation is tilted 23.4° away from the perpendicular of its orbital plane, producing seasonal variations on the planet's surface within a period of one tropical year (365.24 solar days). The Moon is the Earth's only permanent natural satellite; their gravitational interaction causes ocean tides, stabilizes the orientation of Earth's rotational axis, and gradually slows Earth's rotational rate.\n\nEarth's lithosphere is divided into several rigid tectonic plates that migrate across the surface over periods of many millions of years. 71% of Earth's surface is covered with water. The remaining 29% is land mass—consisting of continents and islands—that together has many lakes, rivers, and other sources of water that contribute to the hydrosphere. The majority of Earth's polar regions are covered in ice, including the Antarctic ice sheet and the sea ice of the Arctic ice pack. Earth's interior remains active with a solid iron inner core, a liquid outer core that generates the Earth's magnetic field, and a convecting mantle that drives plate tectonics.\n\nWithin the first billion years of Earth's history, life appeared in the oceans and began to affect the atmosphere and surface, leading to the proliferation of aerobic and anaerobic organisms. Some geological evidence indicates that life may have arisen as much as 4.1 billion years ago. Since then, the combination of Earth's distance from the Sun, physical properties, and geological history have allowed life to evolve and thrive. In the history of the Earth, biodiversity has gone through long periods of expansion, occasionally punctuated by mass extinction events.", wiki: "https://en.wikipedia.org/wiki/Earth", nasa: "http://solarsystem.nasa.gov/planets/earth")
        
        Earth.geology(mass: 5.9723, volume: 108.321, equatorial: 6378.137, density: 55.14, gravity: 9.798, escape_velocity: 11.186, irradiance: 1361.0, geographic_height_variance: 20.4)
        
        Earth.orbitals(year_length: 365.256, perihelion: 147.09, aphelion: 152.10, velocity: 29.78, inclination: 0, eccentricity: 0.0167, day_length: 24.0, equator_inclination: 23.44, min_distance_from_earth: nil, max_distance_from_earth: nil)
        
        Earth.atmosphere(surface_pressure: 1014, average_temperature: 288, total_mass: 5100000000000000)
        
        Earth.misc(discovered: nil)
        
        Earth.display(texture: "earthmap.jpg", model: nil, normalmap: "earthnormalmap.jpg", ringmap: nil, ring_transparencymap: nil, ring_inner_ratio: nil, ring_outer_ratio: nil)
        
        Earth.images(images: [
            ("earth - reef.jpg", "Earth is the only planet in the universe known to harbor life."),
            ("earth - palau.jpg", "Around 71% of Earth's surface is covered by water.  It is one of several bodies in the solar system with water, but Earth is the only body with permenant liquid surface water."),
            ("earth - lights.jpg", "Seen here are the northern lights, which appear when charged particles from the sun strike the armosphere."),
            ("earth - lava.jpg", "Earth, along with the moons Io, Triton, and Enceladus, are the only geolocically active bodies in the solar system.  The Earth's atmosphere is protected by the magnetosphere, which is created by the planet's spinning iron core."),
            ("earth - glacier.jpg", "Glaciers and ice caps account for around 2% of all water on Earth (or around 70% of all fresh water).  Ice caps reflect sunlight back into space."),
            ("earth - falls.jpg", "Less than three percent of all the water on Earth is fresh water.  Fortunately, water that evaporates from the seas leaves behind its salt."),
            ("earth - canyon.jpg", "The dynamic weather conditions shape Earth moreso than other planets.  Seen here is the Grand Canyon, formed by erosion over millions of years.")])
        
        //tofix
        let moon = Moon(name: "Moon", position: 1)
        
        moon.about(description: "The Moon is Earth's only permanent natural satellite. It is the fifth-largest natural satellite in the Solar System, and the largest among planetary satellites relative to the size of the planet that it orbits (its primary). It is the second-densest satellite among those whose densities are known (after Jupiter's satellite Io).\n\nThe average distance of the Moon from the Earth is 384,400 km (238,900 mi), or 1.28 light-seconds.\n\nThe Moon is thought to have formed about 4.5 billion years ago, not long after Earth. There are several hypotheses for its origin; the most widely accepted explanation is that the Moon formed from the debris left over after a giant impact between Earth and a Mars-sized body called Theia.\n\nThe Moon is in synchronous rotation with Earth, always showing the same face, with its near side marked by dark volcanic maria that fill the spaces between the bright ancient crustal highlands and the prominent impact craters. It is the second-brightest regularly visible celestial object in Earth's sky, after the Sun, as measured by illuminance on Earth's surface. Its surface is actually dark, although compared to the night sky it appears very bright, with a reflectance just slightly higher than that of worn asphalt. Its prominence in the sky and its regular cycle of phases have made the Moon an important cultural influence since ancient times on language, calendars, art, mythology, and, it is often speculated, the menstrual cycles of the female of the human species.\n\nThe Moon's gravitational influence produces the ocean tides, body tides, and the slight lengthening of the day. The Moon's current orbital distance is about thirty times the diameter of Earth, with its apparent size in the sky almost the same as that of the Sun, resulting in the Moon covering the Sun nearly precisely in total solar eclipse. This matching of apparent visual size will not continue in the far future. The Moon's linear distance from Earth is currently increasing at a rate of 3.82 ± 0.07 centimetres (1.504 ± 0.028 in) per year, but this rate is not constant.", wiki: "https://en.wikipedia.org/wiki/Moon", nasa: "http://solarsystem.nasa.gov/planets/moon")
        
        moon.geology(mass: 0.07346, volume: 2.1968, equatorial: 1738.1, density: 33.44, gravity: 1.62, escape_velocity: 2.38, irradiance: 1361.0, geographic_height_variance: 13)
        
        moon.orbitals(orbital_length: 29.53, perigee: 0.3633, apogee: 0.4055, velocity: 1.022, inclination: 5.145, eccentricity: 0.0549, day_length: 27.3217, equator_inclination: 6.68)
        
        moon.misc(discovered: nil)
        
        moon.display(texture: "moonmap.jpg", model: nil, normalmap: "moonnormalmap.jpg")
        
        moon.images(images: [
            ("moon - phases.jpg", "The Moon enters different phases based on what direction we observe it from.  These phases form the lunar cycle, which lasts about 29.5 days."),
            ("moon - rover.jpg","The Apollo 17 Lunar Rover being inspected by Astronaut Eugene A. Cernan."),
            ("moon - flag.jpg","The Apollo 14 mission plants its flag on the moon."),
            ("moon - earthrise.jpg","Earthrise from Lunar orbit."),
            ("moon - eclipse.jpg", "Occasionally, the Moon will pass in front of the Sun from the Earth's perspective, causing a solar eclipse over parts of the world.")])
        
        Earth.moons.append(moon)
        
        
        //----------------------------------------------------------------------------------------------
        let Mars = Planet(name: "Mars", type: Type.Rock, position: 4, classification: Class.Major)
        
        Mars.about(description: "Mars is the fourth planet from the Sun and the second-smallest planet in the Solar System, after Mercury. Named after the Roman god of war, it is often referred to as the \"Red Planet\" because the iron oxide prevalent on its surface gives it a reddish appearance. Mars is a terrestrial planet with a thin atmosphere, having surface features reminiscent both of the impact craters of the Moon and the valleys, deserts, and polar ice caps of Earth.\nThe rotational period and seasonal cycles of Mars are likewise similar to those of Earth, as is the tilt that produces the seasons. Mars is the site of Olympus Mons, the largest volcano and second-highest known mountain in the Solar System, and of Valles Marineris, one of the largest canyons in the Solar System. The smooth Borealis basin in the northern hemisphere covers 40% of the planet and may be a giant impact feature. Mars has two moons, Phobos and Deimos, which are small and irregularly shaped. These may be captured asteroids, similar to 5261 Eureka, a Mars trojan.\nThere are ongoing investigations assessing the past habitability potential of Mars, as well as the possibility of extant life. Future astrobiology missions are planned, including the Mars 2020 and ExoMars rovers. Liquid water cannot exist on the surface of Mars due to low atmospheric pressure, which is about  6⁄1000 that of the Earth's, except at the lowest elevations for short periods. The two polar ice caps appear to be made largely of water. The volume of water ice in the south polar ice cap, if melted, would be sufficient to cover the entire planetary surface to a depth of 11 meters (36 ft). On November 22, 2016, NASA reported finding a large amount of underground ice in the Utopia Planitia region of Mars. The volume of water detected has been estimated to be equivalent to the volume of water in Lake Superior.\nMars can easily be seen from Earth with the naked eye, as can its reddish coloring. Its apparent magnitude reaches −2.91, which is surpassed only by Jupiter, Venus, the Moon, and the Sun. Optical ground-based telescopes are typically limited to resolving features about 300 kilometers (190 mi) across when Earth and Mars are closest because of Earth's atmosphere.", wiki: "https://en.m.wikipedia.org/wiki/Mars", nasa: "http://solarsystem.nasa.gov/planets/mars")
        
        Mars.geology(mass: 0.64171, volume: 16.318, equatorial: 3396.2, density: 3933, gravity: 3.71, escape_velocity: 5.03, irradiance: 586.2, geographic_height_variance: 30)
        
        Mars.orbitals(year_length: 686.981, perihelion: 206.62, aphelion: 249.23, velocity: 24.07, inclination: 1.850, eccentricity: 0.0935, day_length: 24.6597, equator_inclination: 25.19, min_distance_from_earth: 55.7, max_distance_from_earth: 401.3)
        
        Mars.atmosphere(surface_pressure: 6.36, average_temperature: 210, total_mass: 25000000000000)
        
        Mars.misc(discovered: "Ancient times")
        
        Mars.display(texture: "marsmap.jpg", model: nil, normalmap: "marsnormalmap.jpg", ringmap: nil, ring_transparencymap: nil, ring_inner_ratio: nil, ring_outer_ratio: nil)
        
        Mars.images(images: [
            ("mars - olympus mons.jpg", "Measuring two and a half times the height of Everest and almost the size of France, Olympus Mons is the largest volcano in the solar system."),
            ("mars - landscape.jpg","Images of the surface taken by the Pathfinder lander.  Pathfinder also delivered a small rover to the surface, named Sojourner."),
            ("mars - pole.jpg", "The north pole of mars, with a large ice cap visible, composed mostly of CO2"),
            ("mars - frosted dunes.jpg", "Sand dunes form on Mars and form patterns when they warm enough to thaw the CO2 permafrost underneath."),
            ("mars - valles marineris.png", "The Valles Marines canyon measures almost four times the length and depth of the Grand Canyon, making it the largest valley in the solar system."),
            ("mars - curiosity selfie.jpg", "Curiosity is the most recent rover to land on Mars; it has been in service since 2012.")])
        
        let Phobos = Moon(name: "Phobos", position: 1)
        
        Phobos.about(description: "Phobos (systematic designation: Mars I) is the innermost and larger of the two natural satellites of Mars, the other being Deimos. Both moons were discovered in 1877 by American astronomer Asaph Hall.\nPhobos is a small, irregularly shaped object with a mean radius of 11 km (7 mi), and is seven times larger than the outer moon, Deimos. Phobos is named after the Greek god, Phobos, a son of Ares (Mars) and Aphrodite (Venus) is the personification of Horror. The name \"Phobos\" is pronounced /ˈfoʊbəs/ foh-bəs or /ˈfoʊbɒs/ foh-bos, or like the Greek Φόβος.\nPhobos orbits 6,000 km (3,700 mi) from the Martian surface, closer to its primary body than any other known planetary moon. It is indeed so close that it orbits Mars much faster than Mars rotates, and completes an orbit in just 7 hours and 39 minutes. As a result, from the surface of Mars it appears to rise in the west, move across the sky in 4 hours and 15 minutes or less, and set in the east, twice each Martian day.\nPhobos is one of the least reflective bodies in the Solar System, with an albedo of just 0.071. Surface temperatures range from about −4 °C (25 °F) on the sunlit side to −112 °C (−170 °F) on the shadowed side. The defining surface feature is the large impact crater, Stickney, which takes up a substantial proportion of the moon's surface.\nImages and models indicate that Phobos may be a rubble pile held together by a thin crust, and that it is being torn apart by tidal interactions. Phobos gets closer to Mars by about 2 meters every one hundred years, and it is predicted that within 30 to 50 million years it will either collide with the planet, or break up into a planetary ring.", wiki: "https://en.wikipedia.org/wiki/Phobos_(moon)", nasa: "http://solarsystem.nasa.gov/planets/phobos")
        
        Phobos.display(texture: nil, model: "phobos.dae", normalmap: nil)
        
        Mars.moons.append(Phobos)
        
        let Deimos = Moon(name: "Deimos", position: 2)
        
        Deimos.about(description: "Deimos (systematic designation: Mars II) is the smaller and outer of the two natural satellites of the planet Mars, the other being Phobos. Deimos has a mean radius of 6.2 km (3.9 mi) and takes 30.3 hours to orbit Mars. The name Deimos is pronounced /ˈdaɪmɒs/ dy-mos, or sometimes /ˈdiːməs/ dee-məs or like the Greek Δεῖμος. In Greek mythology, Deimos was the twin brother of Phobos and personified terror.\nDeimos is 23,460 km (14,580 mi) from Mars, much further than Mars's other moon, Phobos.\nDeimos was discovered by Asaph Hall, Sr. at the United States Naval Observatory in Washington, D.C on 12 August 1877, at about 07:48 UTC (given in contemporary sources as \"11 August 14:40\" Washington mean time, using an astronomical convention of beginning a day at noon, so 12 hours must be added to get the actual local mean time). Hall also discovered Phobos on 18 August 1877, at about 09:14 GMT, after deliberately searching for Martian moons.", wiki: "https://en.wikipedia.org/wiki/Deimos_(moon)", nasa: "http://solarsystem.nasa.gov/planets/deimos")
        
        Deimos.display(texture: nil, model: "deimos.dae", normalmap: nil)
        
        Mars.moons.append(Deimos)
        
        
        //----------------------------------------------------------------------------------------------
        let Jupiter = Planet(name: "Jupiter", type: Type.Gas, position: 5, classification: Class.Major)
        Jupiter.display(texture: "jupitermap.jpg", model: nil, normalmap: nil, ringmap: nil, ring_transparencymap: nil, ring_inner_ratio: nil, ring_outer_ratio: nil)
        
        Jupiter.orbitals(year_length: 686.981, perihelion: 206.62, aphelion: 249.23, velocity: 24.07, inclination: 1.850, eccentricity: 0.0935, day_length: 24.6597, equator_inclination: 3.13, min_distance_from_earth: 55.7, max_distance_from_earth: 401.3)
        
        let Io = Moon(name: "Io", position: 1)
        Io.display(texture: "iomap.jpg", model: nil, normalmap: nil)
        Jupiter.moons.append(Io)
        
        let Europa = Moon(name: "Europa", position: 2)
        Europa.display(texture: "europamap.jpg", model: nil, normalmap: nil)
        Jupiter.moons.append(Europa)
        
        let Ganymede = Moon(name: "Ganymede", position: 3)
        Ganymede.display(texture: "ganymedemap.jpg", model: nil, normalmap: nil)
        Jupiter.moons.append(Ganymede)
        
        let Callisto = Moon(name: "Callisto", position: 4)
        Callisto.display(texture: "callistomap.jpg", model: nil, normalmap: nil)
        Jupiter.moons.append(Callisto)
        
        
        //----------------------------------------------------------------------------------------------
        let Saturn = Planet(name: "Saturn", type: Type.Gas, position: 6, classification: Class.Major)
        Saturn.display(texture: "saturnmap.jpg", model: nil, normalmap: nil, ringmap: "saturnrings.jpg", ring_transparencymap: "saturnringtransparency.jpg", ring_inner_ratio: 1.11, ring_outer_ratio: 2.987)
        
        Saturn.orbitals(year_length: 686.981, perihelion: 206.62, aphelion: 249.23, velocity: 24.07, inclination: 1.850, eccentricity: 0.0935, day_length: 24.6597, equator_inclination: 27, min_distance_from_earth: 55.7, max_distance_from_earth: 401.3)
        
        
        //----------------------------------------------------------------------------------------------
        let Uranus = Planet(name: "Uranus", type: Type.Ice, position: 7, classification: Class.Major)
        Uranus.display(texture: "uranusmap.jpg", model: nil, normalmap: nil, ringmap: nil, ring_transparencymap: nil, ring_inner_ratio: nil, ring_outer_ratio: nil)

        
        //----------------------------------------------------------------------------------------------
        let Neptune = Planet(name: "Neptune", type: Type.Ice, position: 8, classification: Class.Major)
        Neptune.display(texture: "neptunemap.jpg", model: nil, normalmap: nil, ringmap: nil, ring_transparencymap: nil, ring_inner_ratio: nil, ring_outer_ratio: nil)

        
        
        
        
        //----------------------------------------------------------------------------------------------
        let Pluto = Planet(name: "Pluto", type: Type.Rock, position: 9, classification: Class.Dwarf)
        Pluto.display(texture: "plutomap.jpg", model: nil, normalmap: nil, ringmap: nil, ring_transparencymap: nil, ring_inner_ratio: nil, ring_outer_ratio: nil)
        
        
        
        
        return [Class.Major: [Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune], Class.Dwarf: [Pluto]]
    }
    
    static func itemsInSection(_ section: Int) -> Int {
        let objects = planets()
        let classification = Class.allValues[section]
        return objects[classification]!.count
//        var count = 0
//        for planet in objects {
//            if planet.classification == section {
//                count += 1
//            }
//        }
//        return count
    }
}
