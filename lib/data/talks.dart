import '../main.dart';

/* ========== SESSION / SCHEDULE VARIABLES ============ */

/* Create a list of TalkTileItems for Rendering Through the Pages
TODO: Work in Photos and other information necessary for rendering, star variable?
TODO: Add email address(es)?

TalkTitleItem(this.talkTitle, this.talkSpeaker, this.talkLocation,
    this.talkType, this.talkFocus, this.talkDescription,
    this.image1, this.image2, this.website, this.socialMedia, this.coPresenters,
    this.talkDate, this.talkTimeStart, this.talkTimeEnd, this.talkSaved);

 */
List<TalkTitleItem> Day1 = [

  TalkTitleItem('Re-Generate', 'Simone Fezer', 'Berlin Glas',
      'DEMO', 'HOT',
      'Fezer will demonstrate the process behind one of her signature pieces, consisting of a multitude '
          'of organic components that will be assembled hot. The theme is re-generation and resilience; '
          'things growing in arbitrary situations and hostile environments and how nature will always '
          '(re-)generate hope. Fezer will work with contrasting elements, attaching delicate, pre-made '
          'hot-sculpted pieces to a complex blown piece that, in the end, will be a combination of rough, '
          'powdery parts, and bright, shiny, iridescent surfaces. The difference between slick and artificial '
          'mechanical parts and the unrefined, almost ceramic-like vegetal elements evoke the vastly divergent '
          'appearances and properties hot-worked glass can take. Showing the importance of carefully balanced '
          'design despite an intended visual overload, pieces like this navigate the boundary between art and '
          'design and demonstrate that highly-crafted objects can also have a complex conceptual background.',
      'http://www.simonefezer.com' , 'simonefezer', '',
      DateTime.parse('2024-05-17 14:00:00Z'),
      DateTime.parse('2024-05-17 15:30:00Z'),
      false),

  TalkTitleItem('American Cheese', 'Beccy Feather', 'Berlin Glas',
    'DEMO', 'HOT',
      'Four fond(ue) friends bring you an extravagant demonstration of flameworking prowess '
          'and hot shop expertise combined. Muenster your excitement to watch them Kraft an '
          'elegant work of glass with fine detail and smooth design never seen Brie-for. If this '
          'sounds too Gouda to be true, come witness it for yourself! American Cheese will hit '
          'you like a congealed orange slap in the face.',
    'http://www.bbobj.com' , 'bffglass',
    '(Sarah Gilbert, http://www.sarahgilbertglass.net), (Kit Paulson, https://www.kitpaulsonglass.com), (Brent Rogers, http://www.bbobj.com)',
      DateTime.parse('2024-05-18 16:00:00Z'),
      DateTime.parse('2024-05-18 17:30:00Z'),
      false),

  TalkTitleItem('The Punished Head 14mm bowl', 'Zach Puchowitz', 'Monopol Flame Shop',
    'DEMO', 'FLAME',
      'The “American Pipe Maker” is keeping alive a tradition of functional object making that is becoming '
          'extinct in this modern world. There are not many craft objects today that are so desired '
          'and actually used in everyday life, yet are still handcrafted by an individual. \n The '
          'focus of this demo will be sculpting borosilicate glass into a functional form. Puchowitz '
          'will make one of his most iconic designs, The Punished Head 14mm bowl. This object came about '
          'in 2009 when scientific ground glass fittings found their way into the pipe world. The '
          'pipemaking community has always been incorporating function into design while blending '
          'creativity and imagination to make the coolest pipe out there. The Punished Head design shows '
          'how function combines with art.',
    'http://www.ouchkick.com ' , 'ouchkick', '',
      DateTime.parse('2024-05-18 15:00:00Z'),
      DateTime.parse('2024-05-18 16:30:00Z'),
      false),

  TalkTitleItem("Line's Main, Line Work, Flipping Ribbons, Glass Personified", 'Jack Gramann', 'Berlin Glas',
    'DEMO', 'HOT',
      'Jack Gramann will demonstrate one of his favorite methods for creating open forms in the '
          'hot shop within the intersection of playfulness and preparation. Starting with a color '
          'blank, Gramann will form a framework and use blown and solid sculpting techniques to '
          'create a portrait from a ribbon of glass.',
    'https://www.jackgramannglass.com' , 'jackgramann', '',
    DateTime.parse('2024-05-18 10:00:00Z'),
      DateTime.parse('2024-05-18 11:30:00Z'),
      false),

  TalkTitleItem('No Barriers', 'Ondrej Novotny', 'Monopol Flame Shop and Neisen Furnaces',
    'DEMO', 'HOT',
      'Novotny and Boyarinova will present a glass blowing and flameworking collaborative design '
          'themed on flying whales. In the beginning they will work in parallel in the hot shop and '
          'on the torch, attaching together glass parts at the end of the program. This demonstration '
          'aims to display different techniques and artistic languages. Ondřej is a master of pure '
          'minimalistic blown glass. Tatyana works in miniature as a flameworker. They will combine '
          'large and small, sleek design and intricate detail, to demonstrate that distance is not a '
          'barrier to art in a glassy heart.',
    'http://www.novotny-glass.cz' , 'ondrejnovotnyglass',
    '(Tatyana_Boyarinova, https://www.instagram.com/tatyana_boyarinova)',
    DateTime.parse('2024-05-18 10:00:00Z'),
      DateTime.parse('2024-05-18 11:30:00Z'),
      false),

  TalkTitleItem('Inflatable Animal', 'Ned Cantrell', 'Berlin Glas',
    'DEMO', 'HOT',
      'Ned will be making one of his inflatable pool toy animals. Much of Ned’s work consists '
          'of colliding high culture with low culture, observing and reflecting on the absurdities '
          'that arise, and probing the conflict between the subject’s ephemeral nature and the high '
          'level of craftsmanship. Making glass imitate cheap plastic and playing with physical '
          'weight and visual lightness, Ned investigates properties of glass, both physical and '
          'conceptual, and how they influence his work.',
    'http://www.nyholmcantrell.dk' , 'nedcantrell', '',
    DateTime.parse('2024-05-16 10:00:00Z'),
      DateTime.parse('2024-05-16 11:30:00Z'),
      false),

  TalkTitleItem('Alchemy: Evolution of Glass ', 'Jahday Ford', 'Berlin Glas',
    'DEMO', 'HOT',
      'With a constant drive towards breaking the boundaries of glass sculpture, Jahday '
          'Ford breaks the mould \'literally\' with his new Murano-infused methods debuting live '
          'for the first time. Discover new multi-compatible material experimentations using metal '
          'formers, cages, and ceramic molds formed around hot glass. Ford\'s new design approach '
          'shines colourful with theatrical narratives from his Afro-Caribbean heritage and surroundings '
          'from growing up on the Island of Bermuda.',
    'https://www.jahdayfordglass.co.uk/' , 'jahdayfordesign',
    '', DateTime.parse('2024-05-16 16:00:00Z'),
      DateTime.parse('2024-05-16 17:30:00Z'),
      false),

  TalkTitleItem('Silkscreening and Roll-Up Demo', 'Claudia Virginia Vitari', 'Berlin Glas',
    'DEMO', 'HOT',
      'Glass master Peter Kuchinke and artist Claudia Virginia Vitari will collaborate to create '
          'a solid, spherical work that combines screen printing on glass plates with the hot roll-up '
          'technique. Claudia will explain how she prepares flat glass and talk about the concept of '
          'her work while Peter will work in the hot shop. Peter and Claudia have been collaborating '
          'since 2015 to create Vitari\'s ongoing project Interstitial Identities, based on the stories '
          'of many asylum-seeking persons in Berlin.',
    'http://www.claudiavitari.com', 'claudia_virginia_vitari',
    '(Peter Kuchinke, https://www.instagram.com/kuchinkepeter)',
      DateTime.parse('2024-05-16 14:00:00Z'),
      DateTime.parse('2024-05-16 15:30:00Z'),
      false),

  TalkTitleItem('Growing Hand', 'Karen Nyholm', 'Berlin Glas',
    'DEMO', 'HOT',
      'Utiliting the techniques of cup casing, hot sculpting, and assembly, Karen will create one of '
          'her distinctive Growing Hand sculptures. These works are situated in a changing world where '
          'humans have to adapt and the boundary between body and nature is dissolved. Concerned with '
          'humanity\'s role in the world, Karen\'s work interrogates the viewer with questions like, Are we '
          'willing to give up our privileges to improve the living conditions of others? Or can change '
          'only happen through coercion, forced by climate change or war? In addition to glassblowing, '
          'Karen uses techniques from other disciplines such as silversmithing, oil painting, ink, '
          'beadmaking, and ceramics. This stimulating cross-over opens up new ideas and possibilities '
          'for artistic expression.',
    'http://www.nyholmcantrell.dk' , 'karennyholm',
    '', DateTime.parse('2024-05-18 10:00:00Z'),
      DateTime.parse('2024-05-18 11:30:00Z'),
      false),

  TalkTitleItem('Mediterranean Gems: Heritage Meets Contemporary Glass Design',
      'Mert Ungor', 'Berlin Glas',
      'DEMO', 'HOT',
      'Lonca Studio, based in Antalya, Turkey, brings a multidisciplinary approach to exploring the '
          'intricate interplay between design and art, celebrating how they inform and elevate each '
          'other. Lonca\'s creations pay homage to the rich heritage of the Lycians, Ancient Greeks, '
          'Persians, and Romans, blending centuries-old traditions with contemporary sensibilities. '
          'This demonstration will feature a glass piece inspired by a local bird species. Utilizing '
          'the intricate incalmo technique for an all-hot assembly, this captivating showcase not only '
          'demonstrates technical skills but also serves as a tribute to the rich biodiversity and inspiring '
          'natural wonders of the Mediterranean.',
      'http://www.loncastudio.com', 'lonca.studio',
      '', DateTime.parse('2024-05-17 16:00:00Z'),
      DateTime.parse('2024-05-17 17:30:00Z'),
      false),

  TalkTitleItem('Something Old for Something New - Translating of Venetian Technique from the Renaissance into Borosilicate Glass',
      'Simone Crestani', 'Monopol Flame Shop',
      'DEMO', 'FLAME',
      'In this demo, Simone Crestani, master artist in the art of borosilicate glass, will craft one of '
          'his iconic “Alchemica” bottles with precision and attention to details. In his '
          'process, he blends functional design with a distinctive, personal style, combining '
          'blown and unblown elements. Follow the process closely, from shaping the bottle, to '
          'decorating solid glass elements, to creating a perfectly fitting stopper. Discover how '
          'glassmaking can be transformed into a unique work of art, an authentic expression of '
          'personal style through the lampworking of borosilicate.',
      'https://www.simonecrestani.com/' , 'simonecrestani',
      '', DateTime.parse('2024-05-16 14:30:00Z'),
      DateTime.parse('2024-05-16 16:00:00Z'),
      false),

  TalkTitleItem('Sculptural Recycled Glass Flameworking',
      'Ivan Bestari', 'Monopol Flame Shop',
      'DEMO', 'FLAME',
      'This demonstration will highlight Ivan\'s techniques for flameworking using scrap glass. '
          'Highlights will include how he turns scrap glass into usable color rods and then the '
          'process of making sculptural objects using those upcycled rods. Ivan will discuss his '
          'uniquely sustainable practice which uses very minimal equipment and no annealers, pushing '
          'the conversation on responsible and forward-thinking adaptations in glass.',
      'https://www.deviantart.com/ivan12' , 'ivanoozz',
      '', DateTime.parse('2024-05-17 15:00:00Z'),
      DateTime.parse('2024-05-17 16:30:00Z'),
      false),

  TalkTitleItem('Glass Snowdrops',
      'Tatyana Boyarinova', 'Monopol Flame Shop',
      'DEMO', 'FLAME',
      'Snowdrops. Early spring flowers. Beautiful and delicate, they are a perfect example to be '
          'made of glass. This live demonstration will consist of steps from idea to the final '
          'composition. Tatyana will sculpt a snowdrop bud and build up a full flower. Using soft '
          'glass, Tatyana will explain her process and use heat control to create a lifelike bouquet. '
          'Some demo tricks will let you use this working way for your own ideas.',
      '' , 'tatyana_boyarinova',
      '', DateTime.parse('2024-05-17 10:30:00Z'),
      DateTime.parse('2024-05-17 12:00:00Z'),
      false),

  TalkTitleItem('Dialogue of Wheels, Contemporary Glass Engraving',
      'Ioana Stelea', 'Wilhelm Hallen Cold Shop',
      'DEMO', 'COLD',
      'Ioana Stelea and Ann Wenzel will showcase glass engraving techniques. '
          'Using a 19th-century lathe driven by a foot pedal and a 20th-century lathe, they '
          'will show ways of working from different times, and types of wheels, cuts, and '
          'effects on glass objects or fragments, revealing various patterns and textures that '
          'can generate designs. Visuals with the history of the process and samples will be '
          'available to offer a complete experience.',
      'https://ioanastelea.weebly.com/' , 'ioanastelea',
      '(Anne Wenzel, https://www.glasgravur-wenzel.de/)',
      DateTime.parse('2024-05-16 14:00:00Z'),
      DateTime.parse('2024-05-16 15:30:00Z'),
      false),

  TalkTitleItem('Lathe Riders - International Cold Working',
      'Lothar Böttcher', 'Wilhelm Hallen Cold Shop',
      'DEMO', 'COLD',
      'The Lathe Riders will show how art, design, and craft are united at the crossroads of the cold shop, '
          'and that the process of cold working is an integral part of the hand-made glass community. '
          'Different styles from their international collective of cold workers will highlight the '
          'diversity and innovation available — ranging from modern diamond and polishing tools to the '
          'rich techniques of traditional stone cutting. Come chat all things cold with the Lathe Riders '
          'at their pop-up cold shop!',
      'http://lotharbottcher.com' , 'lotharbottcher',
      '(Samuel Weisenborn, https://www.instagram.com/samuelweisenborn), (Patrick Roth, https://www.instagram.com/patrick.roth.glass), (Simon Holm, https://www.instagram.com/simonholm_konstglassliperi)',
      DateTime.parse('2024-05-18 14:00:00Z'),
      DateTime.parse('2024-05-18 17:00:00Z'),
      false),

  /* IMAGES NOT LOADING */
  TalkTitleItem('Engraving-white Unicorn',
      'Jára Šára', 'Wilhelm Hallen Cold Shop',
      'DEMO', 'COLD',
      'The Czech Republic, formerly Bohemia, inherited and preserves the ancient craft of glass engraving '
          'in its purest and most fundamental form. With global social and economic as well as aesthetic '
          'transformations, highly skilled craftsmen have become an underrepresented community, meaning '
          'this craft will gradually vanish. In this demonstration, Šára will provide the history of Bohemian '
          'glass engraving as well as a live demonstration using a 150-year-old lathe. Time will be '
          'set aside for the audience to participate via interaction with the equipment and asking questions.',
      'http://jarasara.com' , 'jarasara81',
      '', DateTime.parse('2024-05-17 10:30:00Z'),
      DateTime.parse('2024-05-17 12:00:00Z'),
      false),

  TalkTitleItem('Luminous Links',
      'Victoria Ahmadizadeh Melendez', 'Monopol Flame Shop',
      'DEMO', 'NEON',
      'Blending traditional tube-bending techniques used to create neon signage with a three-dimensional '
          'approach, Victoria Ahmadizadeh Melendez will create an interwoven hollow glass chain that can '
          'later be pumped with noble gas and illuminated. First shaping soft glass tubes into individual '
          'chain links, Victoria will then build a form by interlocking and splicing the links together, '
          'pushing the boundaries of neon as both a functional light source and a sculptural medium.',
      'http://www.vahmadizadeh.com/' , 'internet___angel',
      '', DateTime.parse('2024-05-16 10:30:00Z'),
      DateTime.parse('2024-05-16 12:00:00Z'),
      false),

  TalkTitleItem('Design or Art? Creating of 3D Sculptures in Glass Fusing Technique',
      'Marta Gibiete', 'Wilhelm Hallen Cold Shop',
      'LECMO', 'KILN',
      'In a multimedia presentation that touches on the history of glassmaking and creativity in Latvia, '
          'Marta will describe the creative quest that led to her particular way of working with glass. '
          'This is a story that can only be told by a glass artist from the Baltics, whose creative life '
          'began in times of change. \nIn addition to the slideshow, Marta will complete one of her '
          'signature works of interconnected glass and copper wire. Samples and technical illustrations '
          'will be provided to deepen the audience\'s understanding of this unique and intricate process.',
      'http://www.martagibiete.com' , 'martagibiete',
      '', DateTime.parse('2024-05-16 10:30:00Z'),
      DateTime.parse('2024-05-16 12:00:00Z'),
      false),

  TalkTitleItem('Practical Magic: Now You See It...',
      'Nate Ricciuto', 'Monopol Lecmo',
      'LECMO', 'KILN',
      'Making use of examples and documentation, Ricciuto will present projects and experiments '
          'highlighting the potential of specialized architectural float glass within his studio '
          'practice. This research began in collaboration with manufacturer NSG Pilkington and explores '
          'the unique physical and optical qualities of invisible conductive coatings and semi-translucent '
          'mirror coatings. Ricciuto will demonstrate the possibilities of integrating these products '
          'with digital and kiln-based processes while discussing this peculiar glass technology as a '
          'curious entry point into the realm of illusion, speculation, and invisible phenomena.',
      'http://www.natericciuto.com' , 'natealso',
      '', DateTime.parse('2024-05-16 10:00:00Z'),
      DateTime.parse('2024-05-16 11:30:00Z'),
      false),

  TalkTitleItem('Is it a window or not? Unconventional and contemporary ways of using stained and flat glass in design and art.',
      'Aaron Peters', 'Wilhelm Hallen Cold Shop',
      'LECMO', 'KILN',
      'Within the bricolage framework of using found materials from the streets of Berlin, Aaron will be '
          'fitting, shaping, and soldering together a three-dimensional artwork; employing the copper foil '
          'technique, a process that is primarily used in stained glass windows and lamp shades. Samples and '
          'examples of ways artists have expanded the possibilities of this highly accessible process in '
          'unconventional and inventive ways will be shown, with the unspoken and lingering question that '
          'will hang over us the whole time: “Is it a window or not?”',
      '' , 'aaroncharlespeters',
      '', DateTime.parse('2024-05-17 16:00:00Z'),
      DateTime.parse('2024-05-17 17:30:00Z'),
      false),

  TalkTitleItem('Laziness, mother of creativity? How I had to create new ways of working in order to adapt to my creative space: physical and mental.',
      'Ricardo Hoineff', 'Monopol Lecmo',
      'LECMO', 'KILN',
      'Fueled by artistic evolution, Ricardo has passionately transitioned from abstract to figurative '
          'art, intertwining powerful LGBTQ+ narratives. This metamorphosis has spurred a '
          'fervent exploration of fusing as his chosen medium. Disenchanted by traditional '
          'methods\' laboriousness and waste, he embarked on a quest for innovation. Inspired by '
          'the simplicity of papier-mâché, Ricardo ingeniously crafted a blend of heat-resistant '
          'paper and binder, birthing reusable molds. Now, he is thrilled to unveil this transformative '
          'technique, eager to empower fellow artists with its boundless potential.',
      'http://hoineff.com/' , 'hoineff.com_',
      '', DateTime.parse('2024-05-18 16:00:00Z'),
      DateTime.parse('2024-05-18 17:30:00Z'),
      false),

  TalkTitleItem('Freeze Casting with Borosilicate Glass',
      'Carrie Strope', 'Monopol Lecmo',
      'LECMO', 'KILN',
      'This lecmo will provide a concise history of the "Freeze and Fuse" process, which has gained '
          'popularity with soft glass but is now being adapted for use with borosilicate glass, unlocking '
          'exciting new possibilities for glass artists.\nThe core focus of this demonstration will be on '
          'translating the freeze-casting technique for use with borosilicate glass, enabling artists '
          'to craft intricate and distinctive designs that were previously unattainable through '
          'traditional molten glass methods. In addition to exploring readily available prefabricated '
          'silicone molds, the lecture will delve into the art of creating custom silicon molds. '
          'For those familiar with working with soft glass at the furnace, this lecture will '
          'demonstrate how seamlessly "Freeze and Fuse" elements can be integrated into their '
          'existing techniques. By incorporating this process into their repertoire, artists can '
          'broaden the range of possibilities in their creations. The presentation will inspire '
          'participants to explore new artistic horizons and push the boundaries of their creativity.',
      'https://calyxglass.com/' , 'calyxann',
      '', DateTime.parse('2024-05-18 14:00:00Z'),
      DateTime.parse('2024-05-18 15:30:00Z'),
      false),

  TalkTitleItem('From Papier-Mâché to Pâte de Verre',
      'Saman Kalantari', 'Monopol Lecmo',
      'LECMO', 'KILN',
      'Kalantari will demonstrate his distinctive and innovative methods for creating pâte de '
          'verre objects. His process includes gathering and recycling waste paper to create '
          'models in papier-mâché. He then transforms the models directly into pâte de verre '
          'objects inside the kiln without the need for wax or refractory materials. Kalantari '
          'will also share information about his career path and professional practices both as '
          'an artist and instructor, touching on glass\'s relationship to other art forms, sustainability '
          'in teaching and practice, and the positive effects material research can have on environmental '
          'well-being.',
      'http://www.samankalantari.art' , 'saman_kalantari_glass',
      '', DateTime.parse('2024-05-16 16:00:00Z'),
      DateTime.parse('2024-05-16 17:30:00Z'),
      false),

  TalkTitleItem('Intergalactic, Intergenerational, Bead Weaving',
      'Adeye Jean-Baptiste', 'Wilhelm Hallen Cold Shop',
      'LECMO', 'KILN',
      'Adeye will demonstrate the steps of her practice for making small-scale aliens. Within the '
          'making of these creatures, Adeye uses a variety of glass techniques from cane pulling '
          'to glass cutting and beading. Adeye hopes to show a wide breadth of both cold and hot '
          'processes that really highlight the full scope of glass. Accompanying the technical side '
          'of the lecmo, Adeye will also delve into the conceptual, addressing why she uses beads '
          'and how they connect her to her ancestral past.',
      '' , 'adayamonthayear',
      '', DateTime.parse('2024-05-17 14:00:00Z'),
      DateTime.parse('2024-05-17 15:30:00Z'),
      false),

  TalkTitleItem('Glass Fabric: Development And Application Of Kente Patterns And Adinkra Symbols In Glass Art',
      'Anthony Amoako Attah', 'Monopol Lecmo',
      'LECMO', 'KILN',
      'This presentation investigates the philosophical, historical, and political representations '
          'of celebrated Adinkra symbols and indigenous Kente patterns using glass as a new medium '
          'to express Amoako Attah\'s Ghanaian culture and identity. The presentation aims to identify '
          'how artists use their native cultural symbols to express personal identity within their practice '
          'and what philosophical perceptions Ghanaians hold about traditional symbols and their '
          'implications on artworks. The presentation also aims to identify how weaving concepts '
          'and techniques can be developed into studio glass processes.\nThe practical portion of this '
          'presentation will examine how digital designs can create forms and compositions, as well as '
          'studio experimentation with the glass through waterjet cutting and kiln-forming techniques. '
          'The presentation will discuss the successful experiments in making glass resemble Kente and '
          'Adinkra cloth through screen-printing techniques and printing glass enamels and powders onto '
          'glass sheets. The artworks produced through this presentation act as a bridge between Western '
          'culture and contemporary Ghanaian art. ',
      '' , 'kente_glass',
      '', DateTime.parse('2024-05-18 10:30:00Z'),
      DateTime.parse('2024-05-18 12:00:00Z'),
      false),

  TalkTitleItem('The Image Within',
      'Brenda Page', 'Monopol Lecmo',
      'LECMO', 'MOLD',
      'This lecmo will explore how to incorporate screen-printed images into the body of cast objects. '
          'Creating images that sit inside a cast object is an involved process. Rather than '
          'having screen-printed images on the surface of the glass, this technique embeds the '
          'images into the core of the cast without any distortion.\nIn addition to videos and images '
          'demonstrating how to achieve this effect, Page will demonstrate a number of the steps involved '
          'in this multi-step process in person: screen printing, wax seam work, and reinvesting. Many '
          'technical notes and meticulously prepared visuals will help viewers walk away with a '
          'comprehensive understanding of how to successfully repeat this process in their own practice.',
      'http://www.brendapage.com.au' , 'brenda_page1',
      '', DateTime.parse('2024-05-16 14:00:00Z'),
      DateTime.parse('2024-05-16 15:30:00Z'),
      false),

  TalkTitleItem('Digital Workflows for Reusable Hot Shop Molds',
      'Brian Gillespie', 'Monopol Lecmo',
      'LECMO', 'MOLD',
      'See examples of 3D design iteration in the computer, including sketching, 3D modeling, rendering, and 3D '
          'printing. Then explore the digital creation of molds and mother molds, including analysis of '
          'undercuts and mold performance. See the production of low-cost molds using 3D printing and '
          'castables normally used in the warm shop, but functional as a reusable, multi-part mold in '
          'the hot shop. Then, see what it takes to produce production molds in cast iron, cast bronze, '
          'or graphite for larger production runs. See example work made using these processes, and see '
          'how little cold working was required to achieve the final results.\nFinally, learn about the '
          'cost breakdown of these processes and how affordable it is to include digital practices in '
          'your studio practice.',
      'https://bgillespie.art' , 'b.gillespie.art',
      '', DateTime.parse('2024-05-17 10:30:00Z'),
      DateTime.parse('2024-05-17 12:00:00Z'),
      false),

  TalkTitleItem('Digital Design and Glass Art',
      'Helen Slater Stokes', 'Monopol Lecmo',
      'LECMO', 'MOLD',
      'This talk examines Helen\'s design process, discussing the interplay between digital and '
          'analogue practices. She will showcase the use of digital techniques, software, and '
          'optical cues in the design stage, and then demonstrate how these elements are '
          'integrated in the glass studio through glass samples and moulds, resulting in the creation '
          'of her unique, almost holographic glass artworks. Helen\'s work taps into her knowledge of '
          'optical science, lenticular imagery, and studio kiln formed glass processes.',
      'http://www.helenslaterglass.com' , 'helenslaterglass',
      '', DateTime.parse('2024-05-17 14:30:00Z'),
      DateTime.parse('2024-05-17 16:00:00Z'),
      false),

  // START HERE FOR NEW TIME ENTRY //
  TalkTitleItem('I Feel a Bit Nervous',
      'Silvia Levenson', 'Wilhelm Hallen Main Stage',
      'LECTURE', 'SOCIAL JUSTICE',
      'Silvia Levenson exists between different realities: between Latin America and Europe, between '
          'the contemporary art world and the glass world, between concepts and process, between thinking '
          'and making.\n\nEven more, she stands between a society that is struggling to change and her '
          'desire for justice.\n\nLevenson began exhibiting work made in glass in 1994 and in this '
          'presentation, she will show how through all these years she has developed work related '
          'to society\'s ills: the desaparecidos during the Argentinean dictatorship, childhood abuse, '
          'violence against women, and post-colonialist policies in the world.\n\nFor 30 years, Levenson has '
          'created installations, sculptures, and videos aimed at dissolving borders both '
          'physical and psychological, and has used glass to be able to see what is happening around her.\n\n'
          'Levenson knows that we can hardly change the world with art, but we can certainly change '
          'the gaze of the beholder. As an artist, Levenson cannot look the other way when she reads '
          'that 50,000 women are killed worldwide each year as a result of femicide. This lecture includes '
          'images of Levenson\'s work and also of projects in which she participated that involved migrants, '
          'refugees, and women.',
      'http://www.silvialenenson.com', 'silvia_levenson',
      '', DateTime.parse('2024-05-16 10:00:00Z'),
      DateTime.parse('2024-05-16 11:00:00Z'),
      false),

  TalkTitleItem('Patternwork of the American Glass Pipe Movement',
    'Christopher McElroy', 'Wilhelm Hallen Lecture',
    'LECTURE', 'HISTORY',
      'This lecture will examine historical and contemporary patterning used by contemporary glass '
          'pipe makers to decorate their elaborate smoking devices. McElroy will identify inspirations '
          'and sources for the use of these patterns in pipe making, from psychedelic imagery of the '
          '1960s to architectural tile work to African basketry to Rorschach tests to Italian glass '
          'techniques to television static.\nPatterning categories will include fume, linework (wig-wag), '
          'dot work, canework, and murrine. McElroy will show a wide range of slides documenting '
          'the sophistication and development of patterns over a 30-year span, focusing '
          'mainly on the work of the last ten years. This lecture will uncover why glass pipes '
          'look like they do today in relation to the pattern work used to ornament them.',
    'http://2strokeglass.com', '2_stroke_glass',
    '', DateTime.parse('2024-05-17 16:30:00Z'),
    DateTime.parse('2024-05-17 17:30:00Z'),
    false),

    TalkTitleItem('CAD and Glass Integration',
      'Ryan Kuhns', 'Monopol Flame Shop',
      'LECTURE', 'TECHNOLOGY',
        'Whether it be multimedia adornments or custom tools, Computer Aided Design (CAD) plays '
            'an integral part in Ryan Kuhns\' process. He will lecture on ways to incorporate CAD '
            'skills with both soft and borosilicate glass and the process to get there. Kuhns '
            'will provide examples of borosilicate glass with components that were designed and '
            'attached via electroforming, glass that was produced using custom blow molds, and '
            'examples of the molds used to make them. This lecture will also include information '
            'on the software, printers, and processes used to complete this work. Kuhns first began '
            'to acquire the design skills needed to incorporate CAD within soft glass while studying '
            'and working professionally in the field of jewelry design. Using both mediums simultaneously '
            'as a designer and artist has afforded him the opportunity to experiment and explore the '
            'ever-growing technologies that meld both together.',
      'http://www.kuhnsglass.com', 'Kuhnsglass',
      '', DateTime.parse('2024-05-16 16:30:00Z'),
        DateTime.parse('2024-05-16 17:30:00Z'),
      false),

    TalkTitleItem('Glass: Hand Formed Matter; Perspectives of Manual Glass Making in Europe',
      'Barbara Schmidt', 'Wilhelm Hallen Lecture',
      'LECTURE', 'COMMUNITY',
        'Over a three-year period, the international project Glass – Hand Formed Matter brought together '
            'glass producers and cultural and higher education institutions from Sweden, Finland, and '
            'Germany to explore the future potential of manual glassmaking in Europe. The project team '
            'will introduce the project, which stands at the intersection of art, design, craft, making, '
            'and knowledge transfer, as well as its network, the exhibition, book and project website, '
            'while looking deeper into some of the works.',
      'https://glass-handformedmatter.kh-berlin.de', 'glass_handformedmatter',
      '', DateTime.parse('2024-05-16 09:30:00Z'),
        DateTime.parse('2024-05-16 10:30:00Z'),
      false),

    TalkTitleItem('Translucent Narratives: A Journey through Romanian Glass Art.',
      'Alexandra Mureșan', 'Wilhelm Hallen Lecture',
      'LECTURE', 'HISTORY',
        'Alexandra Muresan invites us to delve into the intriguing recent history of Romanian glass '
            'art through the narratives of three distinct glass works created by Romanian artists '
            'across generations. Each artwork acts as a metaphorical time capsule, reflecting the '
            'essence of its era, unveiling stories, and emphasizing the influence of cultural and '
            'social shifts on their artistic creation and vision. This lecture broadens perspectives '
            'on global glass art while highlighting the alchemic qualities of the medium.',
      'https://www.instagram.com/alexandramuresanglass', 'alexandramuresanglass',
      '', DateTime.parse('2024-05-16 14:00:00Z'),
        DateTime.parse('2024-05-16 15:00:00Z'),
      false),

    TalkTitleItem('Is glass queer? Or is it just me?',
      'Phillip Murray Bandura', 'Wilhelm Hallen Lecture',
      'LECTURE', 'SOCIAL JUSTICE',
        'Phillip Murray Bandura unveils the transformative power of molten glass in shaping a '
            'queer narrative within the glass community. As a queer gay man, Phillip shares his '
            'personal experiences, showcasing how the Studio Glass Movement became a metaphorical '
            'home, fostering self-acceptance. The lecture is adorned with visual effects and music '
            'that pays tribute to a glass studio dance party. Themes of drag, spectacle, camp, '
            'satire, loss, danger, sexuality, and shared experiences are explored. This presentation '
            'promises an exciting and socially resonant encounter that shall not be forgotten!',
      'http://www.phillipandfriends.ca', 'phillipnfriends',
      '', DateTime.parse('2024-05-16 16:30:00Z'),
        DateTime.parse('2024-05-16 17:30:00Z'),
      false),

    TalkTitleItem('Addressing the Past through a Glass Lens',
      'Alison Lowry', 'Wilhelm Hallen Lecture',
      'LECTURE', 'SOCIAL JUSTICE',
        'How do objects tell stories? Objects can hold a personal resonance-–of the wearer and maker within them. '
            'This lecture will investigate how these objects can ‘perform’ and how they can disseminate a '
            'narrative.\nFor many years Lowry has worked with survivors of the Irish institutional systems- '
            'the Industrial Schools, Mother and Baby Homes, and Magdalene Laundries. This research culminated '
            'in her ongoing exhibition at the National Museum of Ireland, "(A)Dressing our hidden truths."  '
            'Artworks help a wide demographic understand this hidden history, and the museum is a '
            '"safe space" to engage with this emotionally charged and most recent past, allowing '
            'interpretation, and making accessible the current academic inquiries within the field.\nGrowing '
            'up where these institutions operated in plain sight, were supported by the state, '
            'and run by religious institutions meant that Irish society was complicit in their '
            'existence. This lecture asks: Can glass play a role in making contemporary issues '
            'understandable? What are the pros and cons of this approach? And what is the role of '
            'the artist when working with sensitive and challenging aspects of their own history?',
      'http://www.alisonlowry.co.uk', 'Alison_lowry_glass',
      '', DateTime.parse('2024-05-17 14:00:00Z'),
        DateTime.parse('2024-05-17 15:00:00Z'),
      false),

    TalkTitleItem('Wholesale 101',
      'Meghan Bunnell', 'Wilhelm Hallen Lecture',
      'LECTURE', 'CAREER',
        'Pricing for Success! Do you want to improve your sales or start selling your glass? '
            'If so, join Meghan Bunnell, buyer for The Shops of the Corning Museum of Glass, '
            'to hear the principles of the business of selling glass. Discussions will include '
            'the basics of pricing your work, how to reach the wholesale market, and what it takes '
            'to be prepared to represent your work professionally. The goal of this presentation '
            'is to highlight ways to make a living selling glass by recognizing the opportunities '
            'and challenges that exist while celebrating the medium.',
      'http://shops.cmog.org', 'corningmuseumshops',
      '', DateTime.parse('2024-05-17 11:00:00Z'),
        DateTime.parse('2024-05-17 12:00:00Z'),
      false),

    TalkTitleItem('Recycling of Glass into Pigmented Material for Arts Application',
      'Andrew Ojonugwa Adejo', 'Wilhelm Hallen Lecture',
      'LECTURE', 'TECHNOLOGY',
        'Glass as a user-friendly material has accounted for its high usage by virtually every manufacturing '
            'industry for the production of consumer products. The post-consumer effect of this product gives'
            ' rise to environmental challenges. This presentation is centered on the possibility of recycling waste'
            ' glass as pigmented material suitable for art application. Also, it will consider the processes of'
            ' glass identification and collection, processing for application, and colouration into primary'
            ' pigments for artistic application which can double as substrate and pigments for cold glass design.',
      '', '',
      '', DateTime.parse('2024-05-18 09:30:00Z'),
        DateTime.parse('2024-05-18 10:30:00Z'),
      false),

    TalkTitleItem('How we Built the Heavies Glass Sculpture in World (probably)',
      'Daniel Kvesic', 'Wilhelm Hallen Panel',
      'LECTURE', 'TECHNOLOGY',
        'Daniel Kvesic will give you insight surrounding a very interesting project built in Croatia: '
            'A super heavy glass sculpture, a complete wall of glass bricks! The lecture will include '
            'the obstacles encountered, what type of glass was used and how it was made. Daniel will '
            'try to keep you interested in some heavy glass stuff.',
      'http://www.bokart.art', '',
      '', DateTime.parse('2024-05-18 15:00:00Z'),
        DateTime.parse('2024-05-18 16:00:00Z'),
      false),

    TalkTitleItem('Reviving Iridescent Magic: A Contemporary Approach to a Centuries-Old Craft from Mesopotamia to the Present',
      'Fatma Ciftci', 'Wilhelm Hallen Lecture',
      'LECTURE', 'TECHNOLOGY',
        'The technique of paste luster is an ancient method of decorating glass. Evidence of its use by '
            'skilled Mesopotamian glass artisans has been found in archaeological excavations, '
            'indicating its long-standing history. Over time, the use of the paste luster decor '
            'technique on glass surfaces has declined, while its use on glazed ceramic surfaces '
            'has continued to advance. This study focuses on the implementation of novel formulas '
            'derived from historical paste luster formulas used on glass since the 8th century. '
            'This study offers methods for the application of the technique to contemporary '
            'glass-forming processes.',
      'https://www.fatmaciftci.com/en', '',
      '', DateTime.parse('2024-05-18 16:00:00Z'),
        DateTime.parse('2024-05-18 17:00:00Z'),
      false),

    TalkTitleItem('Why Glassblowing is Irrelevant',
      'John Dillard', 'Wilhelm Hallen Lecture',
      'LECTURE', 'HISTORY',
        'Reimagining the previous hierarchal and pedagogical structure of glassmaking. Through the lens '
            'of contemporary practitioners, this lecture recontextualizes material* outside of the narrow'
            'preexisting discourse around methods of production.\n\n\n'
            '*(Defined as: the matter from which a thing can be created)',
      'http://johndillardprojects.com', 'johndillard__',
      '', DateTime.parse('2024-05-18 14:00:00Z'),
        DateTime.parse('2024-05-18 15:00:00Z'),
      false),

  // TODO: FIND A TIME!!! //
  TalkTitleItem('Traditional and non-traditional methods of imagery on glass',
      'Chuchen Song', 'Monopol Lecmo',
      'LECMO', 'KILN',
      'Chuchen Song will focus on the exploration of imagery on glass through both traditional and '
          'non-traditional methods guided by a slideshow of process images. The first portion of the lecmo '
          'will cover the traditional technique of grisaille low-fire enameling that Chuchen primarily '
          'utilizes in her artwork. The second portion of the lecmo will cover various methods of '
          'non-traditional glass imagery techniques. Such examples include screen-printing glass '
          'powder/enamel on glass, CNC laser engraving glass, and utilizing a CNC vinyl cutter for '
          'sandblasting, plus the various digital programs used in these processes. This lecmo will focus on '
          'the possibilities of bringing together all these methods and technologies to become accessible '
          'and affordable for any maker or designer.',
      '', 'chuchen_glass',
      '', DateTime.parse('2024-05-17 16:30:00Z'),
      DateTime.parse('2024-05-17 18:00:00Z'),
      false),

  TalkTitleItem('Endangered Status - The Current Situation for Stained Glass in the UK',
      'Sarah Rothwell', 'Wilhelm Hallen Panel',
      'PANEL', 'COMMUNITY',
      'In 2023, stained glass window making was added to the Red List of Endangered Crafts by the '
          'UK Heritage Crafts Association. This decree stated that the production of traditional '
          'stained-glass work on all scales is at threat in the UK, specifically the design and making '
          'of traditional stained-glass windows for large-scale architectural contexts. To draw some '
          'critical light on this decree, Dr Jasmine Allen, director and curator, Stained Glass '
          'Museum, Ely; Dr Jessamy Kelly, lecturer in glass, Edinburgh College of Art; Sarah '
          'Rothwell, senior curator, modern & contemporary design, National Museums Scotland; and '
          'Sax Shaw, stained glass artist and director of Finnigan & Shaw Ltd., will discuss and '
          'contextualize the British historic and contemporary stained glass sector, and what the '
          'future looks like for this beautiful craft in the UK.',
      'https://www.nms.ac.uk/', 'sarah.j.rothwell',
      '(Jessamy Kelly, jessamykellyglass), (Sax Shaw, saxshaw), (Jasmine Allen, stainedglassmuseum)',
      DateTime.parse('2024-05-17 09:30:00Z'),
      DateTime.parse('2024-05-17 11:00:00Z'),
      false),

  TalkTitleItem('Fostering Creativity and Learning: Exploring the Impact of Nonaccredited Education '
      'in the Creative Glass Community',
      'Chloe Monks', 'Wilhelm Hallen Panel',
      'PANEL', 'EDUCATION',
      'This panel explores the role of nonaccredited glass education as a support network for students '
          'and educators within the creative glass community. The panel comprises four educators and '
          'glass artists from the UK, USA, and Sweden - Michael Endo, glass artist and artistic director '
          'of Pilchuck; Joshua Kerley, glass artist and senior lecturer at the University for Creative '
          'Arts Farnham; Jo Andersson, glass artist and founder of Jo Andersson Studios; and Chloe Monks, '
          'the education program coordinator at the Glass School. The conversation will shed light on the '
          'importance of accessible and affordable independent education, how it can support higher education, '
          'the value of regular teaching for artistic practice, and the distinctions between online and '
          'in-person education in the glass sector.',
      'http://glass-school.co.uk/', 'chloemonks_',
      '(Michael Endo, michael.endo), (Joshua Kerley, joshuakerleymaker), (Jo Andersson, jo.andersson.studios)',
      DateTime.parse('2024-05-16 15:00:00Z'),
      DateTime.parse('2024-05-16 16:30:00Z'),
      false),

  TalkTitleItem('Crafting Calm - Discussion and Strategies on How to Keep Sane as a Glass Artist',
      'Charlott Rodgers', 'Wilhelm Hallen Panel',
      'PANEL', 'MENTAL HEALTH',
      'This is a participatory panel discussion that will focus on physical and mental well-being of artists.\n'
          'Working artists often find themselves in isolated working situations. Deadlines, financial pressures, '
          'and personal circumstances can have a detrimental effect on mental health and physical well-being. The '
          'audience will hear from artist/designer Leona Nicholas about her research into light and well-being '
          'in healthcare facilities through stained glass applications and speak to the individual panelists '
          'about their strategies for coping with stress.\nThe panel will engage in discussions about '
          'different approaches and strategies for stress reduction and well-being that can be integrated '
          'into the busy daily lives of makers. It will discuss how artists can recognise the need for '
          'self-care and adequate breaks in a time when financial insecurity is a big worry. More than '
          'just a panel discussion, this presentation will include a half-hour participatory yoga and '
          'mindfulness session led by artist and qualified Iyengar Yoga teacher Charlott Rodgers. No '
          'equipment is needed, just bring yourself! Suitable for all abilities.',
      '', 'charlottrodgers',
      '(Leona Nicholas, ), (Gregory Alliss, gregoryallissstudioglass)',
      DateTime.parse('2024-05-18 10:30:00Z'),
      DateTime.parse('2024-05-18 12:00:00Z'),
      false),

  TalkTitleItem('The Glass Virus: On the Hybrid II',
      'Gayle Matthias', 'Wilhelm Hallen Panel',
      'PANEL', 'EDUCATION',
      'The Glass Virus is a think tank for educational strategies. They aim to reach a greater understanding '
          'of pedagogy through discursive methodologies. At the GAS Conference, lead educators will explore '
          'the phenomena of Hybrid Creative Practices through moderator-led discussion and creative activities. '
          'Participants will be randomly assigned to a group. At the end, all groups will meet for a joint '
          'discussion and summary of the experience. Pre-registration is required; the link is available on '
          'the GAS website. This event is capped at 35.',
      'https://www.theglassvirus.com/about', 'gayle.matthias',
      '(Caroline Madden, ), (Jens Pfeifer, ), (Jesse Magee, )',
      DateTime.parse('2024-05-16 10:30:00Z'),
      DateTime.parse('2024-05-16 12:00:00Z'),
      false),

  TalkTitleItem('Creating Training and Networking Opportunities to Support Emerging Glass Makers',
      'Sarah Höchstetter', 'Wilhelm Hallen Panel',
      'PANEL', 'CAREER',
      'From 2018 to 2022, Bild-Werk Frauenau, a forum for glass and art in Germany, together with partners '
          'from Bornholm, Denmark, and Graz, Austria, delivered an EU-funded project called GLASS WORKS: '
          'Training, Networking, Taking Roots. At its core was the intention to create new futures for '
          'emerging glass makers, to encourage sustainable careers and creative responses to '
          'changing societies and globalised markets.\nWithin the project, 29 graduates and young '
          'professionals in glass crafts, art, and design from Germany, Denmark, and the Czech Republic '
          'got the opportunity to find their own professional paths and make roots in the European glass '
          'community. Two years after the project, Bild-Werk will bring together the project coordinator '
          'and three former GLASS WORKS trainees in a panel discussion. As a starting point, the panelists '
          'will talk about their professional careers in glass and the impact the program had on their '
          'development. Moving from there, the discussion will focus on different perspectives of what '
          'needs to be done in Europe to help emerging glass artists and designers break ground in the '
          'glass scene and actually make a living out of their chosen profession.',
      'http://www.bildwerkfrauenau.de/', '',
      '(Nathalie Flückiger, nathalieflueckiger), (Selina Weber, selina_amelie), (Zuzana Kubelková, )',
      DateTime.parse('2024-05-17 15:00:00Z'),
      DateTime.parse('2024-05-17 16:30:00Z'),
      false),

  TalkTitleItem('Grantwriting for Artists',
      'Anne Kenealy', 'Wilhelm Hallen Main Stage',
      'WORKSHOP', '',
      'Grantwriting is intimidating for most of us. At the same time, securing funding through '
          'philanthropic organizations can make a big difference in your effectiveness and learning '
          'as an artist. In this roundtable discussion and workshop, Anne Kenealy will provide the '
          'basics of grant writing and strategies she has learned over her 30 years of experience. '
          'Participants will cover how to research and narrow down a list of donor targets, what '
          'should be in an artist statement, how to frame the need for your project, and how to '
          'describe how you will carry it out. Get comfortable with budgets (which can be a great '
          'method for mapping out a project) and learn what to do when your application is accepted '
          'or turned down. "No" doesn\'t necessarily mean "no forever!" This 2-hour interactive '
          'workshop focused mostly on US-specific approaches, will take the mystery out of grant '
          'writing--and, hopefully, some of the discomfort!',
      '', 'annegkenealy',
      '',
      DateTime.parse('2024-05-17 12:30:00Z'),
      DateTime.parse('2024-05-17 14:00:00Z'),
      false),

  TalkTitleItem('Melting Tension - The Benefits of Massage for Glassblowers',
      'Hannah Guisewhite', 'Wilhelm Hallen Main Stage',
      'WORKSHOP', '',
      'Join massage therapist and glass artist Hannah Guisewhite for this interactive midday program '
          'focused on massage therapy for glass artists. The audience will explore techniques that address '
          'the physical and mental strain associated with the art of glass and discuss how to improve overall '
          'wellness, prevent injury, and promote proper body mechanics. Assessing postures and movements '
          'involved in glass artistry can lead to beneficial alterations and ergonomic modifications to '
          'reduce strain and prevent repetitive stress injuries that can be brought on by certain glass '
          'techniques. Another benefit of massage that will be demonstrated is the practice of pre- and '
          'post-stretching to reduce the amount of tension in multiple areas of the body. Particularly when '
          'working with the constant motion of molten glass, the wrists, fingers, and other joints are '
          'particularly affected. When stretching is implemented pre- and post-glass work, it helps reduce '
          'the amount of tension and inflammation that can occur. Attendees will come away with workable '
          'strategies to reduce the possible negative long-term effects that can arise with this beautiful art.',
      '', 'travelinghandsbyhannah',
      '',
      DateTime.parse('2024-05-18 13:00:00Z'),
      DateTime.parse('2024-05-18 14:00:00Z'),
      false),

  TalkTitleItem('Honeymoon, Honeymouth',
      'Suzanne Peck', 'Berlin Glas',
      'PERFORMANCE', '',
      'RIT Graduate students researching the history and theory of glass performance will craft a '
          'collaborative performance that weaves student visions and material curiosities with the '
          'established performance practice of their instructor, Suzanne Peck.\nThe performance will be built '
          'on the research prompt, You love hot glass. You want to consume it. The urge is to not just behold '
          'but to HOLD this beautiful impossible material. You want to envelop glass, and for it to envelop you- '
          'ensnared, ensorcelled, rapt, and ecstatic. You cannot. Molten glass has her boundaries, and you '
          'must respect them. Instead, explore and celebrate this tug between desire and reality through '
          'material rhyming, storytelling, and bodies in motion.\nThis 45-minute hotshop performance '
          'will safely explore the above themes through glass and material play.',
      'http://suzannepeck.com', 'suzannepeck',
      '',
      DateTime.parse('2024-05-17 18:00:00Z'),
      DateTime.parse('2024-05-17 19:30:00Z'),
      false),

  TalkTitleItem('Bonfire',
      'Emilia Marcjasz', '',
      'PERFORMANCE', '',
      'This flameworking performance will create a captivating glass bonfire installation to embody the essence '
          'of a meeting place where art and design intersect to foster connections, discussion, and understanding.'
          '\nThe combination of flameworking and performance art conveys a powerful message about spaces that '
          'encourage open communication, interaction, and understanding among people. This performance will '
          'epitomize the convergence of art and design, and highlight the significance of spaces that bridge '
          'gaps to foster unity and creativity.',
      'https://emiliamarcjasz.webador.com/', 'emilia.marcjasz',
      '',
      DateTime.parse('2000-01-01 00:00:00Z'),
      DateTime.parse('2000-01-01 00:00:00Z'),
      false),

  TalkTitleItem('Rroaring Glass',
      'JanHein van Stiphout', '',
      'PERFORMANCE', '',
      'Curiosity about the sound generated when heating small tubes on the torch led to the development '
          'of this performance piece. Against a background of live improvised music, van Stiphout will '
          'construct an installation of 6 large glass tubes standing erect in a circle, each about 2 meters '
          'tall. Performers will shift from music to sound as they begin to apply heat to one of the tubes '
          'using a large torch. Moments after the torch is removed, the tube will begin to roar on its own '
          'and continue its deep, vibrational reverberations for several minutes. Over the course of the '
          'performance, all six tubes may be roaring at the same time, causing interesting oscillating tones '
          'to emerge. The rroaring creates a visceral sensation and highlights the contrast between music '
          'and sound.',
      'http://www.janheinvanstiphout.com/', '',
      '',
      DateTime.parse('2000-01-01 00:00:00Z'),
      DateTime.parse('2000-01-01 00:00:00Z'),
      false),

  TalkTitleItem('Diamond point engraving with AI design',
      'Siobhan Healy', '',
      'WORKSHOP', '',
      'Healey will combine Artificial Intelligence (AI) design with the traditional craft of diamond '
          'point engraving on glass. Participants will have the opportunity to use an AI design program '
          'to inspire their hand-engraved work, using the skill of diamond point engraving. The workshop '
          'also offers an opportunity to experience and discuss the development of AI and the questions '
          'and worries that are associated with this ever-developing technology. Should we be scared of '
          'AI? Or is it another tool that we can utilize for creativity? Pre-registration suggested.',
      'http://www.healyarts.com/', 'HealyArtsScotland',
      '',
      DateTime.parse('2000-01-01 00:00:00Z'),
      DateTime.parse('2000-01-01 00:00:00Z'),
      false),

  TalkTitleItem('Dialogue and Resource Sharing',
      'Anna Mlasowsky', '',
      'WORKSHOP', '',
      'What, Why, How is not a lecture but a platform for collective dialogue & resource sharing, for '
          'anyone with burning questions to ask the glass community. Anna Mlasowsky will facilitate the '
          'conversation, but the content will be what the participants bring to the table. The workshop is '
          'community led, every participant is likewise an adviser as experiences are shared. Bring any topic: '
          'practical, critical, or philosophical in nature. To pre-register, learn more and submit discussion '
          'topics: https://forms.gle/j7SWjDvb4nd6dwRZ9',
      'https://www.annamlasowsky.com/', 'annamlasowsky',
      '',
      DateTime.parse('2000-01-01 00:00:00Z'),
      DateTime.parse('2000-01-01 00:00:00Z'),
      false),

];

/*Map days = {"May 5": Day1,
  "May 6": Day1,
  "May 7": Day1};*/