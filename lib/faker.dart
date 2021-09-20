
// import './models/article.dart';
// import 'package:faker/faker.dart';

// import 'models/CommentaireModel.dart';
// import 'models/User.dart';
// import 'models/customMarker.dart';
// import 'models/tag.dart';
// import 'package:uuid/uuid.dart';

// var faker = new Faker();
// var uuid = Uuid();

// final tagsData = [
//   Tag(id: 't1', label: 'Logements', isVisible: false),
//   Tag(id: 't2', label: 'Jardins', isVisible: false),
//   Tag(id: 't3', label: 'Parcs', isVisible: false),
//   Tag(id: 't4', label: 'Brique', isVisible: false),
//   Tag(id: 't5', label: 'Béton', isVisible: false),
//   Tag(id: 't6', label: 'Verre', isVisible: false),
//   Tag(id: 't7', label: 'Pierre', isVisible: false),
//   Tag(id: 't8', label: 'Réhabilitation', isVisible: false),
//   Tag(id: 't9', label: faker.lorem.word(), isVisible: false),
//   Tag(id: 't10', label: faker.lorem.word(), isVisible: false),
//   Tag(id: 't11', label: faker.lorem.word(), isVisible: false),
//   Tag(id: 't12', label: faker.lorem.word(), isVisible: false),
//   Tag(id: 't13', label: faker.lorem.word(), isVisible: false),
//   Tag(id: 't14', label: faker.lorem.word(), isVisible: false),
//   Tag(id: 't15', label: faker.lorem.word(), isVisible: false),
//   Tag(id: 't16', label: faker.lorem.word(), isVisible: false),
//   Tag(id: 't17', label: faker.lorem.word(), isVisible: false),
//   Tag(id: 't18', label: faker.lorem.word(), isVisible: false),
//   Tag(id: 't19', label: faker.lorem.word(), isVisible: false),
//   Tag(id: 't20', label: faker.lorem.word(), isVisible: false),
//   Tag(id: 't21', label: faker.lorem.word(), isVisible: false),
//   Tag(id: 't22', label: faker.lorem.word(), isVisible: false),
//   Tag(id: 't23', label: faker.lorem.word(), isVisible: false),
//   Tag(id: 't24', label: faker.lorem.word(), isVisible: false),
//   Tag(id: 't25', label: faker.lorem.word(), isVisible: false),
//   Tag(id: 't26', label: faker.lorem.word(), isVisible: false),
//   Tag(id: 't27', label: faker.lorem.word(), isVisible: false),
//   Tag(id: 't28', label: faker.lorem.word(), isVisible: false),
//   Tag(id: 't29', label: faker.lorem.word(), isVisible: false),
// ];

// final markerData = [
//   CustomMarker(
//       id: uuid.v1().toString(),
//       latitude: 48.863604,
//       longitude: 2.337036,
//       idArticle: articlesData[0].id,
//       isVisible: false,
//       isFavorite: false),
//   CustomMarker(
//       id: uuid.v1().toString(),
//       latitude: 48.861650,
//       longitude: 2.347839,
//       idArticle: articlesData[1].id,
//       isVisible: false,
//       isFavorite: false),
//   CustomMarker(
//       id: uuid.v1().toString(),
//       latitude: 48.860631,
//       longitude: 2.352138,
//       idArticle: articlesData[2].id,
//       isVisible: false,
//       isFavorite: false),
//   CustomMarker(
//       id: uuid.v1().toString(),
//       latitude: 48.859173,
//       longitude: 2.354947,
//       idArticle: articlesData[3].id,
//       isVisible: false,
//       isFavorite: false),
//   CustomMarker(
//       id: uuid.v1().toString(),
//       latitude: 48.848979,
//       longitude: 2.357211,
//       idArticle: articlesData[4].id,
//       isVisible: false,
//       isFavorite: false),
//   CustomMarker(
//       id: uuid.v1().toString(),
//       latitude: 48.848632,
//       longitude: 2.356642,
//       idArticle: articlesData[5].id,
//       isVisible: false,
//       isFavorite: false),
//   CustomMarker(
//       id: uuid.v1().toString(),
//       latitude: 48.861134,
//       longitude: 2.298179,
//       idArticle: articlesData[6].id,
//       isVisible: false,
//       isFavorite: false),
//   CustomMarker(
//       id: uuid.v1().toString(),
//       latitude: 48.853676,
//       longitude: 2.328320,
//       idArticle: articlesData[7].id,
//       isVisible: false,
//       isFavorite: false),
//   CustomMarker(
//       id: uuid.v1().toString(),
//       latitude: 48.870178,
//       longitude: 2.307712,
//       idArticle: articlesData[8].id,
//       isVisible: false,
//       isFavorite: false),
//   CustomMarker(
//       id: uuid.v1().toString(),
//       latitude: 48.837215,
//       longitude: 2.382771,
//       idArticle: articlesData[9].id,
//       isVisible: false,
//       isFavorite: false),
//   CustomMarker(
//       id: uuid.v1().toString(),
//       latitude: 48.8404272,
//       longitude: 2.3701717,
//       idArticle: articlesData[10].id,
//       isVisible: false,
//       isFavorite: false),
//   CustomMarker(
//       id: uuid.v1().toString(),
//       latitude: 48.826005,
//       longitude: 2.381828,
//       idArticle: articlesData[11].id,
//       isVisible: false,
//       isFavorite: false),
//   CustomMarker(
//       id: uuid.v1().toString(),
//       latitude: 48.821644,
//       longitude: 2.351161,
//       idArticle: articlesData[12].id,
//       isVisible: false,
//       isFavorite: false),
//   CustomMarker(
//       id: uuid.v1().toString(),
//       latitude: 48.837229,
//       longitude: 2.331895,
//       idArticle: articlesData[13].id,
//       isVisible: false,
//       isFavorite: false),
//   CustomMarker(
//       id: uuid.v1().toString(),
//       latitude: 48.838452,
//       longitude: 2.322485,
//       idArticle: articlesData[14].id,
//       isVisible: false,
//       isFavorite: false),
//   CustomMarker(
//       id: uuid.v1().toString(),
//       latitude: 48.830121,
//       longitude: 2.313549,
//       idArticle: articlesData[15].id,
//       isVisible: false,
//       isFavorite: false),
//   CustomMarker(
//       id: uuid.v1().toString(),
//       latitude: 48.823727,
//       longitude: 2.332781,
//       idArticle: articlesData[16].id,
//       isVisible: false,
//       isFavorite: false),
//   CustomMarker(
//       id: uuid.v1().toString(),
//       latitude: 48.837829,
//       longitude: 2.292852,
//       idArticle: articlesData[17].id,
//       isVisible: false,
//       isFavorite: false),
//   CustomMarker(
//       id: uuid.v1().toString(),
//       latitude: 48.851846,
//       longitude: 2.265464,
//       idArticle: articlesData[18].id,
//       isVisible: false,
//       isFavorite: false),
//   CustomMarker(
//       id: uuid.v1().toString(),
//       latitude: 48.843553,
//       longitude: 2.253006,
//       idArticle: articlesData[19].id,
//       isVisible: false,
//       isFavorite: false),
//   CustomMarker(
//       id: uuid.v1().toString(),
//       latitude: 48.899042,
//       longitude: 2.320725,
//       idArticle: articlesData[20].id,
//       isVisible: false,
//       isFavorite: false),
//   CustomMarker(
//       id: uuid.v1().toString(),
//       latitude: 48.892441,
//       longitude: 2.304774,
//       idArticle: articlesData[21].id,
//       isVisible: false,
//       isFavorite: false),
//   CustomMarker(
//       id: uuid.v1().toString(),
//       latitude: 48.890628,
//       longitude: 2.312296,
//       idArticle: articlesData[22].id,
//       isVisible: false,
//       isFavorite: false),
//   CustomMarker(
//       id: uuid.v1().toString(),
//       latitude: 48.891480,
//       longitude: 2.394019,
//       idArticle: articlesData[23].id,
//       isVisible: false,
//       isFavorite: false),
//   CustomMarker(
//       id: uuid.v1().toString(),
//       latitude: 48.889481,
//       longitude: 2.391617,
//       idArticle: articlesData[24].id,
//       isVisible: false,
//       isFavorite: false),
//   CustomMarker(
//       id: uuid.v1().toString(),
//       latitude: 48.853674,
//       longitude: 2.398984,
//       idArticle: articlesData[25].id,
//       isVisible: false,
//       isFavorite: false),
//   CustomMarker(
//       id: uuid.v1().toString(),
//       latitude: 48.8922241,
//       longitude: 2.2354779,
//       idArticle: articlesData[26].id,
//       isVisible: false,
//       isFavorite: false),
//   CustomMarker(
//       id: uuid.v1().toString(),
//       latitude: 48.924458,
//       longitude: 2.028361,
//       idArticle: articlesData[27].id,
//       isVisible: false,
//       isFavorite: false),
//   CustomMarker(
//       id: uuid.v1().toString(),
//       latitude: 48.855882,
//       longitude: 2.218324,
//       idArticle: articlesData[28].id,
//       isVisible: false,
//       isFavorite: false),
//   CustomMarker(
//       id: uuid.v1().toString(),
//       latitude: 48.876722,
//       longitude: 2.263536,
//       idArticle: articlesData[29].id,
//       isVisible: false,
//       isFavorite: false),
// ];

// final articlesData = [
//   Article(
//       id: uuid.v1().toString(),
//       tags: [tagsData[0].id, tagsData[4].id],
//       title: 'Les Deux Plateaux',
//       date: '1986',
//       operation: 'Daniel Buren',
//       lieu: '2 rue de Montpensier 75001',
//       textEn: faker.lorem.sentences(15).join(' '),
//       text: faker.lorem.sentence() + ' \intro' + faker.lorem.sentence()),
//   Article(
//       id: uuid.v1().toString(),
//       tags: [tagsData[0].id],
//       title: 'La Canopée',
//       date: "2016",
//       architecte: 'Patrick Berger + Jacques Anziutti',
//       lieu: '101 rue Berger 75002',
//       textEn: faker.lorem.sentences(15).join(' '),
//       text:
//           '''Le Forum des Halles est l’accès au cœur de la ville de Paris via son infrastructure souterraine et, de ce fait, l’un de ses espaces publics majeurs. La Canopée, continuation bâtie du jardin des Halles, tisse un entrelac entre le mouvement effréné des usages et le plaisir bucolique, entre la ville et la nature. Le paysage artificiel qu’est la Canopée n’abrite pas moins de 25000 m² de surface utile sans jamais donner l’impression de bâti ou de bâtiment. \intro
// En désuétude depuis de nombreuses années, le Forum des Halles a trouvé avec le projet le Patrick Berger et Jacques Anziutti la dignité de sa situation urbaine. Il est en effet à la fois le centre de gravité et la porte d’entrée principale de l’agglomération parisienne par ce même centre, via la gare multimodale en sous-sol. Il constitue un des espaces publics majeurs de la métropole à toutes les échelles : celle du quartier des Halles, celle de l’agglomération francilienne, celle de la nation et celle du monde. 

// La Canopée fusionne avec le jardin des Halles redessiné pour l’occasion. La Canopée n’est pas un bâtiment. Elle est la continuité artificialisée de la frondaison naturelle des arbres de ce jardin. Ensembles, ils constituent l’espace public dégagé et appropriable, l’espace de rencontre et de mixité sociale, l’espace de respiration et de fraicheur en plein centre de la capitale française. Ensembles, ils ouvrent le monde souterrain à la surface et aux monuments patrimoniaux que sont La Bourse et l’Eglise St Eustache. Calme et fluide, légère et diaphane, la Canopée, toute en courbes douces, apaise la complexité et la turbulence des flux transformant le rush quotidien en déambulation plaisante dans un espace spectaculaire et lumineux. La Canopée est « une forme à l’équilibre », comme le disent ses auteurs, qui améliore les liaisons et les lisibilités entre le dessous et le dessus, entre le passé et le présent, entre l’usage et l’atmosphère. La forme de la Canopée résulte d’un équilibre entre toutes les dynamiques du site.

// Les formes de la Canopée ne sont pas directement celles de la nature et ne sont pas figuratives. C’est plutôt sa morphogénèse, son code génétique, qui se réfère à celui de la nature. La Canopée ne ressemble à aucune forêt mais fabrique un espace couvert aux caractéristiques physiques identiques au sous-bois. D’ailleurs, comme le précise Patrick Berger, « Dans l’art des jardins, la canopée désigne tout autant le volume supérieur des arbres que le cadre naturel qu’elle constitue pour l’homme ». Dans le même temps, et à l’inverse, l’univers de métal et de verre en grandes portées de la Canopée n’est pas sans évoquer l’image déformée des anciennes Halles.

// La toiture superpose des bandes disjointes et décalées de couverture vitrée entre lesquelles circulent l’air et la lumière donnant l’impression d’être en plein air tout en restant à l’abri la pluie et du soleil. L’écoulement des eaux de pluie sur le verre laisse percevoir et entendre le jeu de ses cheminements multiples. L’eau, l’air et la lumière, semblent, dans leur fluidité dessiner et redessiner les nervures et les surfaces curvilignes de la toiture. « L’énergie de la nature et l’énergie de la ville se conjuguent dans les mêmes tracés ».

// Dans son ensemble, le programme accueilli sous la Canopée comporte : 5000 m² de commerces et 14500 m² d’équipements culturels mutualisés dont un centre culturel hip hop, la maison des pratiques artistiques amateurs, le kiosque jeunes, un conservatoire et une médiathèque.

// La structure métallique en coque inversée et rigidifiée permet l’ouverture complète sur le jardin en une seule portée en optimisant considérablement la matière et en forçant la légèreté. La couleur sable unique démultiplie les tons et les nuances à l’infini dans l’entrelac de métal et de verre sous l’effet de la lumière. La couleur sable illumine la nef que le temps soit ensoleillé ou gris.

// '''),
//   Article(
//       id: uuid.v1().toString(),
//       tags: [tagsData[1].id, tagsData[2].id, tagsData[7].id],
//       title: 'Le Centre Pompidou',
//       date: '1977',
//       architecte: 'Renzo Piano + Richard Rogers',
//       operation: '',
//       patrimoine: '',
//       lieu: 'Place Georges-Pompidou 75004',
//       textEn: faker.lorem.sentences(15).join(' '),
//       // commentaires: [
//       //   ...commentairesData
//       //       .where((element) => element.idArticle == articlesData[3].id)
//       //       .toList(),
//       // ],
//       text:
//           '''Me voici donc seul sur la terre, n'ayant plus de frère, de prochain, d'ami, de société que moi-même. Le plus sociable et le plus aimant des humains en a été proscrit par un accord unanime. Ils ont cherché dans les raffinements de leur haine quel tourment pouvait être le plus cruel à mon âme sensible, et ils ont brisé violemment tous les liens qui m'attachaient à eux. J'aurais aimé les hommes en dépit d'eux-mêmes. Ils n'ont pu qu'en cessant de l'être se dérober à mon affection. Les voilà donc étrangers, inconnus, nuls enfin pour moi puisqu'ils l'ont voulu. Mais moi, détaché d'eux et de tout, que suis-je moi-même? Voilà ce qui me reste à chercher. Malheureusement cette recherche doit être précédée d'un coup d'oeil sur ma position. C'est une idée par laquelle il faut nécessairement que je passe pour arriver d'eux à moi.
// '''),
//   Article(
//       id: uuid.v1().toString(),
//       tags: [tagsData[3].id],
//       title: 'Lafayette Anticipation',
//       date: '2012',
//       architecte: 'OMA',
//       operation: '',
//       patrimoine: '',
//       lieu: '9 rue du Plâtre 75004',
//       textEn: faker.lorem.sentences(15).join(' '),
//       text:
//           '''Pour Guillaume Houzé, président de Lafayette Anticipations, « L’urgence n’était pas de créer une énième boite à bijoux pour collectionneur mécène, mais de bâtir, en plein cœur de Paris, une boite à outils qui permette aux artistes de démultiplier leur capacité d’action et au public d’être mis en présence, non pas de leur œuvre, mais de leur travail ». Donc, ni musée, ni fondation, mais plutôt une « fabrique » des œuvres de création présentées, in fine, au public ; œuvres de création dans les domaines croisés de l’art, de la mode et du design. Pour cela, il a été choisi de réhabiliter un ancien bâtiment industriel classé, ancien entrepôt du Bazar de l’Hôtel de Ville, construit en 1891 par l’architecte Samuel Menjot de Dammartin. Cet immeuble en U autour d’une cour présente l’avantage d’un double accès - Rue du Plâtre et Rue Sainte Croix de La Bretonnerie – qui permet au public piéton de transiter d’une rue à l’autre, en rez-de-chaussée, de façon permanente, renouant ainsi avec la tradition des « Passages de Paris ».

// Le programme, repartit sur 4 niveaux et 2200 m² : 
// - Un atelier de création, sous la verrière sommitale bénéficiant d’un équipement high-tech de machines-outils.
// - Un atelier de fabrication, en sous-sol, équipé d’outils et de machines destinés à la réalisation matérielle des expositions.
// - Des espaces d’expositions sur 875 m², une boutique et un café restaurant dans les niveaux intermédiaires.

// L’immeuble classé excluant toutes modifications de ses façades et, encore plus, toute surélévation, l’architecture d’OMA s’est faite invisible de l’extérieur avec une restauration du bâtiment existant à l’identique et avec beaucoup de soins. Seule la cour a permis d’ériger une tour métallique, fine et performante, dans la hauteur du bâtiment, pour apporter la flexibilité et la souplesse d’utilisation qui manquait aux niveaux tous identiques de l’ancien entrepôt. A l’aide de 6 poteaux métalliques équipés de crémaillères et de 4 plateaux mobiles de différentes tailles coulissants le long de ces crémaillères, cette véritable machine de théâtre va pouvoir « changer le décor » et ajouter en quelques minutes, ici et là, aux ailes du U, des surfaces de planchers supplémentaires en modifiant la forme et la topologie des espaces d’expositions. Une cinquantaine de possibilités s’offrent ainsi aux opérateurs. Le rêve utopique d’une l’architecture mobile et nomade dans une culture de l’espace jusque-là rigide et sédentaire est donc réalisé ici même. Sans doute, Rem Koolhaas s’est-il inspiré de la maison Lemoine qu’il a réalisé près de Bordeaux et qui permet à son propriétaire handicapé de bénéficier d’une véritable maison-ascenseur dans laquelle les espaces de vie évoluent au gré de ses usages de manière interactive.

// En termes de matériaux, pierre et fonte de la construction initiale lourde et fermée, contraste fortement avec acier et bois de la tour miracle légère et ouverte. L’architecture dessinée et formelle de la première s’oppose aussi à l’évanescence et à l’instabilité de la seconde. Une seule chose les unit cependant, c’est la recherche commune de « performance » mais, ceci à des époques différentes. C’est, peut-être, cet air de famille qu’on pourrait qualifier aussi de « beauté de l’utile », qui permet de répondre au mieux à l’objectif du maitre d’ouvrage de construire « une structure intime qui renouvelle l’expérience du salon où on se retrouve pour boire un verre et parler ».Ce bâtiment délaissant l’apparence formelle pour l’atmosphère de la création en train de se faire constitue, malgré la modestie de sa taille, la manifestation d’une architecture nouvelle qui, comme le dit Rem Koolhass, « cherche à échapper au destin fatal de la stagnation en architecture ». 

// /boldOMA et Rem Koolhaas à l’œuvre dans l’architecture contemporaine./bold

// Le monde est en mutation, son architecture aussi. Rem Koolhaas fondateur de OMA est parti à sa recherche depuis les années 70. La question de la « densité » et de son apothéose qu’il nomme la « congestion » changent fondamentalement les paradigmes de l’architecture devenus obsolètes. 

// Ainsi à l’échelle métropolitaine, OMA porte son attention sur la dimension urbaine de l’architecture plutôt que la dimension architecturale de la ville, c’est-à-dire la « forme urbaine » comme l’avaient envisagé les post modernes. Il s’agit de prendre au sérieux tout contexte avec un « regard positif », d’éviter toute arrogance, de renoncer à la signature architecturale et finalement à l’architecture de la forme pour adopter une « neutralité relative » en mesure d’accepter « le changement qu’est la vie » et les désirs qui vont avec. La qualité du projet architectural ne réside plus dans le «design » final mais dans la stratégie qui le mène et les processus qui en découlent. 

// La notion de « Bigness », enfant de la densité, engendre une approche de la verticalité prenant le pas sur le plan horizontal. On peut ainsi imaginer des rues ou des parcs verticaux et que le devant / derrière traditionnel de la maison anglosaxonne devienne le dessous / dessus.

// La concentration de « Bigness » plutôt que son étalement engendre une stratégie du vide plutôt que du plein, du vide potentiel nécessaire dans une approche en termes de paysage plutôt que de forme. 

// Sur le plan philosophique, l’abandon forcé de la totalité est une évidence, on ne peut plus envisager une programmation et un plan global pour la ville mais seulement infléchir, au coup par coup, son évolution sauvage. La discontinuité devient une condition majeure de l’architecture dont le rôle consiste à tisser des liens entre les fragments et à penser la notion d’intervalle. 

// L’expression architecturale de ces stratégies conduit souvent OMA à privilégier le parcours ou ce que l’on appelle la « promenade architecturale » comme système organisationnel. Le parcours, donc le mouvement plutôt que la composition statique de la symétrie ou de la grille. 

// On trouve également un fréquent effacement apparent de la gravité, une négation du poids et, par-là, l’abandon de la vérité constructive chère aux modernes. 

// La recherche d’une forme insolite, comme celle du siège de CCTV à Pékin, une forme simple qu’il est paradoxalement impossible de redessiner de mémoire est leur façon d’éviter la prégnance de la forme en la rendant insaisissable et en la brouillant.

// Le « puit piranésien » de Lille qui fait interférer et rend visible tous les flux (train, cars, voitures, cycles piétons, en un seul point est devenu un leitmotiv chez OMA. Ce dispositif relève de la volonté d’habiter les flux et d’utiliser leur dynamique et leur énergie plutôt que de s’en isoler en les considérant comme nuisance. Ce dispositif permet de conserver la fluidité de la ville plutôt que de la compartimenter.

// Le regard positif et le respect du déjà là conduit OMA et quel que soit l’échelle de leur intervention à recycler ce qui précède en refusant systématiquement la « table rase ».

// La recherche permanente de « performance » en termes d’usage les conduit à l’utilisation, dans leur démarche, de diagrammes pour approcher la complexité de gros programmes. Comme dans le cas la bibliothèque de Seattle, il est fréquent que le projet final reprenne la silhouette de ces diagrammes exprimant ainsi non pas la fonction mais bel et bien la performance, notion plus abstraite mais plus efficiente. 

// Plutôt qu’une œuvre, l’architecture est, de plus en plus, à considérer comme un produit, un produit universel et non spécifique. A l’exemple de l’industrie automobile qui crée des « concept cars » qui ne sont jamais directement réalisés, OMA produit des « concept buildings » qui orientent l’avenir de la ville. C’est le cas, par exemple de l’« hyper building » qui est, selon eux, « la marche suivante ».'''),
//   Article(
//     id: uuid.v1().toString(),
//     tags: [tagsData[6].id, tagsData[7].id],
//     title: 'Institut du Monde Arabe',
//     date: '1987',
//     architecte: 'J.Nouvel + P.Soria + G.Lézénès + Architecture Studio',
//     operation: '',
//     patrimoine: '',
//     lieu: '1 rue des Fossés Saint-Bernard 75005',
//   ),
//   Article(
//       id: uuid.v1().toString(),
//       tags: [tagsData[6].id, tagsData[7].id],
//       title: 'Pavillon Mobile Art Chanel',
//       date: '2011',
//       architecte: 'Zaha Hadid',
//       operation: '',
//       patrimoine: '',
//       lieu: '1 rue des Fossés Saint-Bernard 75005',
//       textEn: faker.lorem.sentences(15).join(' '),
//       text:
//           '''Lorem ipsum dolor sit amet, consectetur adipiscing elit.\intro Aenean vestibulum leo nec tortor blandit mattis. Sed in ultricies lacus, at vulputate dui. Nam vehicula tortor vitae lacinia facilisis. Aenean mollis justo ac lacus interdum elementum nec vitae nulla. Curabitur quis porta sem. Maecenas auctor augue in lectus ultrices, sed placerat neque hendrerit. Ut aliquam blandit pellentesque. Mauris ac eleifend libero, ac porttitor erat. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Suspendisse volutpat dui at ligula pulvinar aliquet. Cras mattis turpis quis metus suscipit, ac luctus nisl ornare. Aenean suscipit aliquam dapibus. Vivamus porta tellus sed ipsum tempor fringilla.

// Praesent euismod urna aliquet libero fermentum, non posuere quam ultricies. In et urna dapibus, finibus mauris sagittis, elementum nisl. Morbi pellentesque libero vitae dignissim fermentum. In ac justo ornare, facilisis tellus quis, suscipit felis. Donec id orci lobortis, maximus nisi nec, ultricies ante. Nunc suscipit scelerisque nisi, a varius velit consequat at. Curabitur at ultricies purus. Aenean vulputate, nibh nec ultricies tincidunt, odio metus aliquet tellus, quis tristique ligula est et dolor. Donec dignissim sollicitudin scelerisque. Ut quis purus eros. Suspendisse efficitur lobortis ligula, ut ornare nunc auctor efficitur. Nullam condimentum ipsum non est gravida semper. Phasellus vel risus magna. 
// '''),
//   Article(
//     id: uuid.v1().toString(),
//     tags: [tagsData[0].id, tagsData[4].id, tagsData[5].id],
//     title: 'Musée du quai Branly',
//     date: '2006',
//     architecte: 'Jean Nouvel',
//     operation: '',
//     patrimoine: '',
//     lieu: '37 quai Branly  75007',
//   ),
//   Article(
//       id: uuid.v1().toString(),
//       tags: [tagsData[4].id],
//       title: 'Maison de Verre',
//       date: '1931',
//       architecte: 'Pierre Chareau',
//       operation: '',
//       patrimoine: '',
//       lieu: '31 rue Saint-Guillaume 75007',
//       textEn: faker.lorem.sentences(15).join(' '),
//       // commentaires: [
//       //   ...commentairesData
//       //       .where((element) => element.idArticle == articlesData[7].id)
//       //       .toList(),
//       // ],
//       text:
//           '''"Lorem ipsum dolor sit amet, consectetur adipiscing elit."\intro Morbi eget pharetra enim. Cras at quam at ipsum cursus fringilla. Sed massa dui, rhoncus et arcu et, semper accumsan leo. Maecenas at tortor ullamcorper odio porttitor aliquet. Proin nec laoreet erat, imperdiet ornare diam. Phasellus ultricies dictum rhoncus. Vestibulum velit risus, dignissim non est quis, iaculis aliquam velit. '''),
//   Article(
//     id: uuid.v1().toString(),
//     tags: [tagsData[5].id, tagsData[1].id, tagsData[2].id],
//     title: 'Showroom Citroen',
//     date: '2007',
//     architecte: 'Manuelle Gautrand',
//     operation: '',
//     patrimoine: '',
//     lieu: '42 avenue des Champs-Elysées 75008',
//     text: faker.lorem.sentences(5).join(' ') +
//         '\intro ' +
//         faker.lorem.sentences(20).join(' '),
//     textEn: faker.lorem.sentences(15).join(' '),
//     // commentaires: [
//     //   ...commentairesData
//     //       .where((element) => element.idArticle == articlesData[8].id)
//     //       .toList(),
//     // ]
//   ),
//   Article(
//     id: uuid.v1().toString(),
//     tags: [tagsData[3].id, tagsData[4].id],
//     title: 'La Cinemathèque Française',
//     date: '1994',
//     architecte: 'Frank Gehry',
//     operation: '',
//     patrimoine: '',
//     lieu: '51 Rue de Bercy 75012',
//     text:
//         '${faker.lorem.sentences(5).join(' ')}\intro  ${faker.lorem.sentences(20).join(' ')}',
//     textEn: faker.lorem.sentences(15).join(' '),
//     audio: 'RYYZN-MemoriesErased.mp3',
//     // commentaires: [
//     //   ...commentairesData
//     //       .where((element) => element.idArticle == articlesData[9].id)
//     //       .toList(),
//     // ]),
//   ),
//   Article(
//     id: uuid.v1().toString(),
//     tags: [tagsData[2].id],
//     title: 'Cité de la mode et du design',
//     date: '2008',
//     architecte: 'Jakob + Macfarlane',
//     operation: '',
//     audio: 'A_Virtual_Friend-Feel_Sorry.mp3',
//     patrimoine: '',
//     lieu: '34 quai d\'Austerlitz 75013',
//     // commentaires: [
//     //   ...commentairesData
//     //       .where((element) => element.idArticle == articlesData[10].id)
//     //       .toList(),
//     // ]
//   ),
//   Article(
//     id: uuid.v1().toString(),
//     tags: [tagsData[7].id, tagsData[8].id],
//     title: 'M6B2 Tour de la Biodiversité',
//     date: '2016',
//     architecte: 'Edouard François',
//     operation: '',
//     patrimoine: '',
//     lieu: '32 boulevard du Général d\'Armée Jean Simon 75013',
//     text: faker.lorem.sentences(15).join(' '),
//     textEn: faker.lorem.sentences(15).join(' '),
//     // commentaires: [
//     //   ...commentairesData
//     //       .where((element) => element.idArticle == articlesData[11].id)
//     //       .toList(),
//     // ]),
//   ),
//   Article(
//     id: uuid.v1().toString(),
//     tags: [tagsData[0].id, tagsData[4].id, tagsData[5].id],
//     title: 'Pushed Slab',
//     date: '2014',
//     architecte: 'MVRDV',
//     operation: '',
//     patrimoine: '',
//     lieu: '10 rue Brillat-Savarin 75013',
//     // commentaires: [
//     //   ...commentairesData
//     //       .where((element) => element.idArticle == articlesData[12].id)
//     //       .toList(),
//     // ]),
//   ),
//   Article(
//     id: uuid.v1().toString(),
//     tags: [tagsData[3].id, tagsData[6].id],
//     title: 'Fondation Cartier pour l\'art contenmporain',
//     date: '1984',
//     architecte: 'Jean Novel',
//     operation: '',
//     patrimoine: '',
//     lieu: '261  boulevard Raspail 75014',
//     text: faker.lorem.sentences(5).join(' ') +
//         '\intro ' +
//         faker.lorem.sentences(20).join(' '),
//     textEn: faker.lorem.sentences(15).join(' '),
//     // commentaires: [
//     //   ...commentairesData
//     //       .where((element) => element.idArticle == articlesData[13].id)
//     //       .toList(),
//     // ]),
//   ),
//   Article(
//     id: uuid.v1().toString(),
//     tags: [tagsData[0].id, tagsData[5].id],
//     title: 'Gaîté Montparnasse quartier',
//     date: '2008',
//     operation: '',
//     patrimoine: 'MVRDV',
//     lieu: 'Gaîté Montparnasse 75014',
//     text: faker.lorem.sentences(15).join(' '),
//     textEn: faker.lorem.sentences(15).join(' '),
//     // commentaires: [
//     //   ...commentairesData
//     //       .where((element) => element.idArticle == articlesData[14].id)
//     //       .toList(),
//     // ]),
//   ),
//   Article(
//     id: uuid.v1().toString(), //16
//     tags: [tagsData[0].id, tagsData[5].id],
//     title: '57 logements',
//     date: '2000',
//     architecte: 'Herzog et Demeuron',
//     operation: '',
//     patrimoine: '',
//     lieu: '17-19 rue des Suisses 75014',
//     text: faker.lorem.sentences(15).join(' '),
//     textEn: faker.lorem.sentences(15).join(' '),
//   ),
//   Article(
//     id: uuid.v1().toString(),
//     tags: [tagsData[0].id, tagsData[5].id],
//     title: 'Maison Ozenfant',
//     date: '1922',
//     architecte: 'Le Corbusier',
//     operation: '',
//     patrimoine: '',
//     lieu: '53 avenue Reille 75014',
//     text: faker.lorem.sentences(15).join(' '),
//     textEn: faker.lorem.sentences(15).join(' '),
//   ),
//   Article(
//     id: uuid.v1().toString(),
//     tags: [tagsData[0].id, tagsData[5].id],
//     title: 'Hôpital Cognacq Jay',
//     date: '2006',
//     architecte: 'Toyo Ito',
//     operation: '',
//     patrimoine: '',
//     lieu: '15 rue Eugène Million 75015',
//     text: faker.lorem.sentences(15).join(' '),
//     textEn: faker.lorem.sentences(15).join(' '),
//   ),
//   Article(
//     id: uuid.v1().toString(),
//     tags: [tagsData[0].id, tagsData[5].id],
//     title: 'Maison Laroche + Fondation Le Corbusier',
//     date: '1925',
//     architecte: 'Le Corbusier',
//     operation: '',
//     patrimoine: '',
//     lieu: '10 square du Docteur Blanche 75016',
//     text: faker.lorem.sentences(15).join(' '),
//     textEn: faker.lorem.sentences(15).join(' '),
//   ),
//   Article(
//     id: uuid.v1().toString(),
//     tags: [tagsData[0].id, tagsData[5].id],
//     title: 'Stade Jean Bouin',
//     date: '2007',
//     architecte: 'Rudy Ricciotti',
//     operation: '',
//     patrimoine: '',
//     lieu: 'Anne Lacaton + Jean Philippe Vassal',
//     text: faker.lorem.sentences(15).join(' '),
//     textEn: faker.lorem.sentences(15).join(' '),
//   ),
//   Article(
//     id: uuid.v1().toString(),
//     tags: [tagsData[0].id, tagsData[5].id],
//     title: 'Réhabilitation de la tour "Bois le Prêtre"',
//     date: '2011',
//     architecte: 'Anne Lacaton + Jean Philippe Vassal',
//     operation: '',
//     patrimoine: '',
//     lieu: '5 boulevard du Bois-le-Prêtre 75017',
//     text: faker.lorem.sentences(15).join(' '),
//     textEn: faker.lorem.sentences(15).join(' '),
//   ),
//   Article(
//     id: uuid.v1().toString(),
//     tags: [tagsData[0].id, tagsData[5].id],
//     title: 'Tower Flower',
//     date: '2004',
//     architecte: 'Edouard François',
//     operation: '',
//     patrimoine: '',
//     lieu: '23 rue Albert Roussel 75017',
//     text: faker.lorem.sentences(15).join(' '),
//     textEn: faker.lorem.sentences(15).join(' '),
//   ),
//   Article(
//     id: uuid.v1().toString(),
//     tags: [tagsData[0].id, tagsData[5].id],
//     title: '170 logements Clichy Batignolles',
//     date: '2018',
//     architecte: 'Mateus Aires + Vincent Parreira',
//     operation: '',
//     patrimoine: '',
//     lieu: '48 rue Mstislav Rostropovitch 75017',
//     text: faker.lorem.sentences(15).join(' '),
//     textEn: faker.lorem.sentences(15).join(' '),
//   ),
//   Article(
//     id: uuid.v1().toString(),
//     tags: [tagsData[0].id, tagsData[5].id],
//     title: 'La Philharmonie',
//     date: '2015',
//     architecte: 'Jean Nouvel',
//     operation: '',
//     patrimoine: '',
//     lieu: '221 avenue Jean Jaurès 75019',
//     text: faker.lorem.sentences(15).join(' '),
//     textEn: faker.lorem.sentences(15).join(' '),
//   ),
//   Article(
//     id: uuid.v1().toString(),
//     tags: [tagsData[0].id, tagsData[5].id],
//     title: 'Le Parc de la Villette',
//     date: '1997',
//     architecte: 'Bernard Tschumi',
//     operation: '',
//     patrimoine: '',
//     lieu: '211 avenue Jean Jaurès 75019',
//     text: faker.lorem.sentences(15).join(' '),
//     textEn: faker.lorem.sentences(15).join(' '),
//   ),
//   Article(
//     id: uuid.v1().toString(),
//     tags: [tagsData[0].id, tagsData[5].id],
//     title: 'Eden bio',
//     date: '2009',
//     architecte: 'Edouard François',
//     operation: '',
//     patrimoine: '',
//     lieu: '21 rue de Vignoles 75020',
//     text:
//         '''Eden Bio est un écoquartier livré en 2008 qui abrite 99 logements sociaux, des ateliers d’artiste, des espaces communs et commerces et un parking en sous-sol.
// Tous les immeubles sur rue de l’ilot ont été entièrement conservées. L’intervention se situe à l’intérieur de l’ilot sous forme de 3 longues bandes bâties : un immeuble de 3 étages au centre et 2 rangées parallèles de maisons presque iconiques de part et d’autre. Le tout desservi par 2 étroites venelles n’excédant guère plus de 2 mètres de large. L’immeuble central enfoui dans la végétation, véritable « masse boisée », comme le dit l’architecte, accueille, pour l’essentiel, ateliers d’artistes, espaces communs et commerces. Les maisons mitoyennes accueillent, elles, les logements. L’ensemble joue la diversité en utilisant des « matériaux de clapier », morceaux de briques, tuiles mécaniques, bastaings de bois, revêtements de zinc ou de cuivre, béton brut, individualisant chacune des constructions et poursuivant l’atmosphère faubourien propre au 20ème arrondissement. Les venelles, bien sûr inaccessibles aux véhicules, bordées de barrières bois type « Canard Volland », retracent la mémoire du passé maraicher du lieu. Aucun hall d’entrée, dispositif trop bourgeois pour ce quartier populaire, n’apparait. Les accès sont individuels directement depuis les venelles via des escaliers de bois pour les étages. Ces nombreuses structures symbolisent un peu les échafaudages du chantier permanent d’un quartier vivant en train de se construire socialement sur lui-même. 
// La végétation est très présente et contribue fortement au bien être « sans façons » de l’Eden Bio, mais n’appelle-t-on pas Edouard François « Le grand vert » ? Il a, en effet, souhaité décaper le sol d’ancienne friches urbaines et le remplacer par un mètre de terre végétale certifiée bio. Sur cette terre nouvelle, il a laissé ensuite agir la nature qui l’a recouvert de plantes sauvages et pionnières comme les ailantes ou les arbres à papillon. Des plantes grimpantes comme la glycine ou la vigne vierges ont, elles, été plantées et ont très vite colonisées les façades. Des plantes exotiques, bananes ou agrumes, apparaissent dans des serres de jardin, implantée ici ou là, servant à abriter les boites aux lettres regroupées.
// Si les caractéristiques techniques de la qualité environnementale en matière d’isolation, de matériaux ou d’énergie sont respectées comme dans les autres projets de niveau BBC, ce sont ses qualités humaines qui le distingue, celles qui donnent envie d’habiter, envie de s’approprier et envie de vivre, tout simplement. 
// Edouard François à l’œuvre dans l’architecture contemporaine
// Edouard François, architecte d’origine aristocratique assumée ne mâche pas ses mots dans un franc parler allant droit au but sans verbiage. Iconoclaste à l’humour parfois grinçant, il ne laisse pas indifférent : on adore ou on déteste. On pourrait dire la même chose de l’architecture qu’il produit avec son équipe de « la maison Edouard François », son agence. Cette architecture s’investit particulièrement dans le monde végétal autant de manière directe et concrète que de manière analogique. Ceci constitue une approche de l’architecture écologique toute particulière échappant aux tendances actuelles notamment technocratiques. « Le vert comme nature » dit Edouard François « va devenir emblématique du développement durable et cet emblème commence à être utilisé à tort et à travers. J’ai commencé cette approche de façon contextuelle, je trouvais intéressant d’opposer un parc à une façade végétale car cela apporte du sens ». Son architecture contextuelle, au cas par cas, produit des projets opportunistes et imprévisibles desquels il est difficile de dégager des principes généraux et encore moins une théorie. Il est toutefois possible de percevoir des éléments de continuité dans cet œuvre dans l’attitude et la démarche plutôt que dans le résultat, comme par exemple :
// - Faire moins pour faire avec.
// - Rechercher la transformation plutôt que l’innovation.
// - Faire rebondir entre eux le sens et les sens.
// - Tendre le projet entre primitivisme et futurisme.
// - Adopter une approche circonstancielle plutôt que réellement contextuelle.
// - Brouiller les pistes entre naturel et artificiel.
// - Utiliser les outils de l’art contemporain pour donner sens et atmosphère, comme le « collage » ou la « répétition » de « motifs » (arbres en pots de Tower-Flower).
// Ce parcours architectural sans véritable trajectoire prédéfinie permet à Edouard François de croiser et d’apporter des réponses singulières aux enjeux contemporains récurrents que sont, entre autres : l’écologie bien sûr, la densité, la pluralité, la fragmentation, …
// ''',
//     textEn: faker.lorem.sentences(15).join(' '),
//   ),
//   Article(
//     id: uuid.v1().toString(),
//     tags: [tagsData[0].id, tagsData[5].id],
//     title: 'La Grande Arche',
//     date: '1989',
//     architecte: 'Johan Otto von Spreckelsen',
//     operation: '',
//     patrimoine: '',
//     lieu: '1 parvis de la Défense 92800',
//     text: faker.lorem.sentences(15).join(' '),
//     textEn: faker.lorem.sentences(15).join(' '),
//   ),
//   Article(
//     id: uuid.v1().toString(),
//     tags: [tagsData[0].id, tagsData[5].id],
//     title: 'Villa Savoye',
//     date: '1931',
//     architecte: 'Le Corbusier',
//     operation: '',
//     patrimoine: '',
//     lieu: '82 rue de Villiers 78300 Poissy',
//     text: faker.lorem.sentences(15).join(' '),
//     textEn: faker.lorem.sentences(15).join(' '),
//   ),
//   Article(
//     id: uuid.v1().toString(),
//     tags: [tagsData[0].id, tagsData[5].id],
//     title: 'Villa Dall\'Ava',
//     date: '1991',
//     architecte: 'Rem Koolhaas',
//     operation: '',
//     patrimoine: '',
//     lieu: 'Villa Dall\'Ava Avenue Clodoald 92210 Saint-Cloud',
//     text: faker.lorem.sentences(15).join(' '),
//     textEn: faker.lorem.sentences(15).join(' '),
//   ),
//   Article(
//     id: uuid.v1().toString(),
//     tags: [tagsData[0].id, tagsData[5].id],
//     title: 'Fondation Louis Vuitton',
//     date: '2006',
//     architecte: 'Frank Gehry',
//     operation: '',
//     patrimoine: '',
//     lieu: '8 Avenue du Mahatma Gandhi – Paris 16ème ',
//     text:
//         '''Située dans le Bois de Boulogne et mitoyen avec le Jardin d’Acclimatation, la Fondation Louis Vuitton, est un bâtiment de 46 m de haut, de 150 m de long et de 11000m². Elle accueille une collection d’art essentiellement contemporain et a pour mission la présentation de collections permanentes, l’organisation d’expositions temporaires et de manifestations pluridisciplinaires, la mise en place de rencontres, de débats et de colloques ainsi qu’une mission pédagogique auprès du jeune public. 
// Frank Gehry avait débuté sa carrière en construisant des maisons constituées de l’« assemblage » d’objets et de leurs interstices à la façon des « natures mortes » du peintre Morandi qu’il admirait. La Fondation relève finalement toujours de la même genèse mais à une beaucoup plus grande échelle. Il s’agit ici de l’assemblage de blocs de béton blanc tel un archipel d’icebergs dont les interstices sont recouverts de 12 voiles de verres. Les blocs contiennent l’essentiel des espaces clos et couverts dont les 11 galeries d’expositions reparties sur 3 niveaux. Les interstices, supports privilégiés des dessertes des galeries et donc des parcours des visiteurs, forment un espace labyrinthique et ascensionnel occasionnant une multitude de terrasses s’ouvrant sur toute la ville de Paris à différentes hauteurs. Pour finir, cet archipel d’icebergs et ses voiles de verre ont été déposés sur un bassin crée à cet effet et alimenté par les eaux de pluies récupérées sur les 13000 m² de surfaces vitrées. La construction est une serre dans le Jardin d’Acclimatation, une grande serre « transparente, ludique et sérieuse » s’inscrivant dans la longue tradition des architectures de verre parisiennes comme le Palais d’Hiver.
// La composition architecturale qui nait initialement des mains de Frank Gehry sous forme de maquette de papier ne provient pas d’une conception intellectuelle portant sur le sens ou la raison mais relève bien au contraire du rapport direct de la main à l’objet, c’est-à-dire de la pure sensation. Sensation inspirée par le Bois de Boulogne, par le Jardin d’Acclimatation, par la spécificité parisienne, par l’idée de l’art, par les gens eux-mêmes. On aura, In fine, sensation de légèreté, sensation de lumière, sensation d’élégance et d’esthétique, sensation de mouvement. L’architecture produite faite de fragments sans synthèse, de plis tout en douceur comme les draps du lit, de déambulations labyrinthiques sans objectif, vise tout simplement le plaisir d’être là et le plaisir du moment.
// « Nuage de verre », « ailes de verre », « Insecte géant aux ailes de verre », « vaisseau culturel », « observatoire de la lumière », …, autant de dénominations données par les uns et les autres qui montrent, d’une part, l’appropriation que lui vouent ses visiteurs et, d’autre part, la force de son signifiant en même temps que la polysémie de son signifié. Structurellement les voiles, constituées de bandes de verre courbe, s’appuient sur les blocs autoportants revêtus de plaques de béton « Ductal » blanc par l’intermédiaire d’une structure métallique évoquant l’univers nautique. La complexité géométrique et technique, jamais atteinte en architecture jusque-là, a nécessité le recours à des outils informatiques très élaborés et à l’intervention d’ingénieurs chercheurs aptes à résoudre les nouveaux problèmes posés. A ce titre, pas moins d’une trentaine de brevets révolutionnant l’utilisation de matériaux comme le verre ou l’acier ont dû être déposés. Ainsi, par exemple, la structure d’apparence fragile n’en est pas moins capable de résister à des rafales de vent de 180 km/h.
// Conformément aux attentes, la Fondation Louis Vuitton constitue un espace nouveau qui offre à un large public et aux artistes, une plateforme de débat et de réflexion pour l’art et la culture en même temps qu’un bâtiment emblématique du 21ème siècle. 
// Frank Gehry à l’œuvre dans l’architecture contemporaine.
// Frank Gehry, architecte californien et du monde, développe une stratégie de pensée et d’action qui exploite le potentiel créatif de la demande populaire au sein de la société de consommation tout en gardant une dimension savante. Ainsi, selon lui, la consommation accélérée entraine moins d’intelligibilité ; l’architecture doit être plus directe, plus proche des techniques publicitaires que des rhétoriques académiques et ne nécessite ni sens, ni idéologie, ni style. Il commence en 1960 par travailler avec des matériaux industriels low-cost comme la tôle ondulée, il fait des bâtiments comme certains font des tambours avec des tonneaux industriels. Il s’inscrit dans une démarche artistique inspirée par Johnny Cage, Claes Oldenbourg et le Pop Art qui reproduisent la banalité de « la vie de tous les jours » pour régénérer l’art. La décontextualisation d’objets d’usage quotidien, l’altération d’échelle remplacent la recherche de sens et de valeurs esthétiques. On retrouve dans son architecture le nomadisme de la pensée juive au sein de laquelle « habiter » signifie découvrir plutôt que prendre racine et l’habitation n’est pas un territoire composé mais plutôt un espace incertain. A la « monumentalité » classique de l’architecture fruit de la composition et de la mesure, c’est-à-dire de l’esthétique académique, il oppose l’« instrumentalité » fruit du service et de la performance, c’est-à-dire de la satisfaction du désir. Surréalisme et Dadaïsme sont également à l’œuvre dans sa démarche avec des méthodes de travail basées sur le hasard et la coïncidence qu’il nomme « jazzy improvisation ».
// Chaque projet commence par un croquis-concept, un gribouillis expressif duquel émerge une multitude de maquettes d’études, le plus souvent en carton, papier, aluminium ou bois. Il s’en suit, plus ou moins rapidement, une maquette finale pour laquelle il délègue beaucoup à ses partenaires. Cette maquette est alors scannée pour générer des dessins numériques de travail qui permettent de géométriser et de construire les espaces. Il lui arrive également de travailler dans la phase heuristique en conviant des artistes tels que Robert Irwin, Ed Moss ou Richard Serra. Quelques fois la source d’inspiration provient d’une découverte fortuite : c’est le cas de sa rencontre avec une sculpture Baroque de Claes Sluter du 14ème siècle à Dijon en 1990. Les « draperies baroques » métamorphoseront son projet de Bilbao alors en cours et inonderont nombre de ses projets ultérieurs comme nouvelle expérience immersive.
// Ses bâtiments on fait voler en éclat les principes de l’Architecture Moderne et ont largement contribué à l’avènement de l’architecture contemporaine. Selon lui, l’informatique permet de faire émerger des solutions architecturales inédites comme de pouvoir construire un mur souple comme un drap ou de plier du verre comme du papier. L’informatique lui a également permis de gérer plus de complexité, plus de pluralité et aussi de sensibilité. Elle lui a ainsi paradoxalement permis de réconcilier technologie et artisanat.
// A la façon des déconstructivistes, Frank Gehry optera pour l’inachèvement volontaire et l’instabilité des espaces qu’il produit s’efforçant de les faire apparaitre sans cesse en train de se façonner sans jamais atteindre de statut final ; c’est ce qu’il nomme « molding space ». Parcours labyrinthiques, effet puzzle, famille d’objets semblables mais pas identiques, fragmentation, mouvement, … sont autant d’autres dispositifs récurrent présents dans son œuvre.
// ''',
//     textEn: faker.lorem.sentences(15).join(' '),
//   ),
// ];

// final usersData = [
//   UserCustom(
//     id: 'b1',
//     nom: 'CHRISTIAN',
//     prenom: 'DREVET',
//     eMail: 'joh.doe@gmail.com',
//     dateNaissance: '01/01/1970',
//     phone: '0666666666',
//     passeword: '16111928',
//     favoris: [],
//   ),
//   UserCustom(
//     id: 'b2',
//     nom: 'SARAH',
//     prenom: 'CONTE',
//     eMail: 'alex.bernard@gmail.com',
//     dateNaissance: '05/05/1970',
//     phone: '0444444444',
//     passeword: '20122021',
//     favoris: [],
//   ),
// ];

// final commentairesData = [
//   CommentaireModel(
//       identifiant: faker.randomGenerator.integer(10000).toString(),
//       auteur: usersData[random.integer(2, min: 0)],
//       date: faker.date.dateTime(),
//       idArticle: articlesData[11].id,
//       contenu: faker.lorem.sentences(10).join(' ')),
//   CommentaireModel(
//       identifiant: faker.randomGenerator.integer(10000).toString(),
//       auteur: usersData[random.integer(2, min: 0)],
//       date: faker.date.dateTime(),
//       idArticle: articlesData[10].id,
//       contenu: faker.lorem.sentences(10).join(' ')),
//   CommentaireModel(
//       identifiant: faker.randomGenerator.integer(10000).toString(),
//       auteur: usersData[random.integer(2, min: 0)],
//       date: faker.date.dateTime(),
//       idArticle: articlesData[10].id,
//       contenu: faker.lorem.sentences(10).join(' ')),
//   CommentaireModel(
//       identifiant: faker.randomGenerator.integer(10000).toString(),
//       auteur: usersData[random.integer(2, min: 0)],
//       date: faker.date.dateTime(),
//       idArticle: articlesData[10].id,
//       contenu: faker.lorem.sentences(10).join(' ')),
//   CommentaireModel(
//       identifiant: faker.randomGenerator.integer(10000).toString(),
//       auteur: usersData[random.integer(2, min: 0)],
//       date: faker.date.dateTime(),
//       idArticle: articlesData[2].id,
//       contenu: faker.lorem.sentences(10).join(' ')),
//   CommentaireModel(
//       identifiant: faker.randomGenerator.integer(10000).toString(),
//       auteur: usersData[random.integer(2, min: 0)],
//       date: faker.date.dateTime(),
//       idArticle: articlesData[2].id,
//       contenu: faker.lorem.sentences(10).join(' ')),
//   CommentaireModel(
//       identifiant: faker.randomGenerator.integer(10000).toString(),
//       auteur: usersData[random.integer(2, min: 0)],
//       date: faker.date.dateTime(),
//       idArticle: articlesData[2].id,
//       contenu: faker.lorem.sentences(10).join(' ')),
//   CommentaireModel(
//       identifiant: faker.randomGenerator.integer(10000).toString(),
//       auteur: usersData[random.integer(2, min: 0)],
//       date: faker.date.dateTime(),
//       idArticle: articlesData[2].id,
//       contenu: faker.lorem.sentences(10).join(' ')),
//   CommentaireModel(
//       identifiant: faker.randomGenerator.integer(10000).toString(),
//       auteur: usersData[random.integer(2, min: 0)],
//       date: faker.date.dateTime(),
//       idArticle: articlesData[7].id,
//       contenu: faker.lorem.sentences(10).join(' ')),
//   CommentaireModel(
//       identifiant: faker.randomGenerator.integer(10000).toString(),
//       auteur: usersData[random.integer(2, min: 0)],
//       date: faker.date.dateTime(),
//       idArticle: articlesData[7].id,
//       contenu: faker.lorem.sentences(10).join(' ')),
//   CommentaireModel(
//       identifiant: faker.randomGenerator.integer(10000).toString(),
//       auteur: usersData[random.integer(2, min: 0)],
//       date: faker.date.dateTime(),
//       idArticle: articlesData[7].id,
//       contenu: faker.lorem.sentences(10).join(' ')),
//   CommentaireModel(
//       identifiant: faker.randomGenerator.integer(10000).toString(),
//       auteur: usersData[random.integer(2, min: 0)],
//       date: faker.date.dateTime(),
//       idArticle: articlesData[12].id,
//       contenu: faker.lorem.sentences(10).join(' ')),
//   CommentaireModel(
//       identifiant: faker.randomGenerator.integer(10000).toString(),
//       auteur: usersData[random.integer(2, min: 0)],
//       date: faker.date.dateTime(),
//       idArticle: articlesData[12].id,
//       contenu: faker.lorem.sentences(10).join(' ')),
//   CommentaireModel(
//       identifiant: faker.randomGenerator.integer(10000).toString(),
//       auteur: usersData[random.integer(2, min: 0)],
//       date: faker.date.dateTime(),
//       idArticle: articlesData[12].id,
//       contenu: faker.lorem.sentences(10).join(' ')),
//   CommentaireModel(
//       identifiant: faker.randomGenerator.integer(10000).toString(),
//       auteur: usersData[random.integer(2, min: 0)],
//       date: faker.date.dateTime(),
//       idArticle: articlesData[12].id,
//       contenu: faker.lorem.sentences(10).join(' ')),
//   CommentaireModel(
//       identifiant: faker.randomGenerator.integer(10000).toString(),
//       auteur: usersData[random.integer(2, min: 0)],
//       date: faker.date.dateTime(),
//       idArticle: articlesData[8].id,
//       contenu: faker.lorem.sentences(10).join(' ')),
//   CommentaireModel(
//       identifiant: faker.randomGenerator.integer(10000).toString(),
//       auteur: usersData[random.integer(2, min: 0)],
//       date: faker.date.dateTime(),
//       idArticle: articlesData[8].id,
//       contenu: faker.lorem.sentences(10).join(' ')),
//   CommentaireModel(
//       identifiant: faker.randomGenerator.integer(10000).toString(),
//       auteur: usersData[random.integer(2, min: 0)],
//       date: faker.date.dateTime(),
//       idArticle: articlesData[8].id,
//       contenu: faker.lorem.sentences(10).join(' ')),
//   CommentaireModel(
//       identifiant: faker.randomGenerator.integer(10000).toString(),
//       auteur: usersData[random.integer(2, min: 0)],
//       date: faker.date.dateTime(),
//       idArticle: articlesData[9].id,
//       contenu: faker.lorem.sentences(10).join(' ')),
//   CommentaireModel(
//       identifiant: faker.randomGenerator.integer(10000).toString(),
//       auteur: usersData[random.integer(2, min: 0)],
//       date: faker.date.dateTime(),
//       idArticle: articlesData[9].id,
//       contenu: faker.lorem.sentences(10).join(' ')),
//   // CommentaireModel(
//   //     identifiant: 'a1',
//   //     idArticle: 'a2',
//   //     auteur: usersData[0],
//   //     date: DateTime.now(),
//   //     contenu:
//   //         'hendrerit, enim ac mollis dapibus, turpis lacus egestas dolor, placerat fringilla nulla ante id turpis. Etiam in neque tempus, ultrices enim et, faucibus urna. Fusce semper tristique ipsum, eget semper turpis vestibulum sagittis. Sed urna felis, rutrum sed posuere sed, scelerisque non nisi. Aliquam ornare, sem id condimentum vestibulum, magna tortor dictum nibh, vel tempus neque tellus a est. Donec facilisis magna vitae ultricies porta. Ut tincidunt mi nunc, id iaculis ipsum placerat et.'),
//   // CommentaireModel(
//   //     identifiant: articlesData[2].id,
//   //     idArticle: 'a2',
//   //     auteur: usersData[0],
//   //     date: DateTime.now(),
//   //     contenu:
//   //         'hendrerit, enim ac mollis dapibus, turpis lacus egestas dolor, placerat fringilla nulla ante id turpis. Etiam in neque tempus, ultrices enim et, faucibus urna. Fusce semper tristique ipsum, eget semper turpis vestibulum sagittis. Sed urna felis, rutrum sed posuere sed, scelerisque non nisi. Aliquam ornare, sem id condimentum vestibulum, magna tortor dictum nibh, vel tempus neque tellus a est. Donec facilisis magna vitae ultricies porta. Ut tincidunt mi nunc, id iaculis ipsum placerat et.'),
//   // CommentaireModel(
//   //     identifiant: 'a2',
//   //     idArticle: 'a2',
//   //     auteur: usersData[1],
//   //     date: DateTime.now(),
//   //     contenu:
//   //         'L\'ilot Rivoli, entrée du passage, assez hétérogène en termes de bâti et de moins bonne qualité que \"les bijoux architecturaux\", sera en grande partie unifié par un sorte de robe de verre odulant au rythme de fenêtre existantes. Outre assurer le dialogue des oppositions unité hétérogénité  '),
//   CommentaireModel(
//       identifiant: faker.randomGenerator.integer(10000).toString(),
//       auteur: usersData[random.integer(2, min: 0)],
//       date: faker.date.dateTime(),
//       idArticle: articlesData[14].id,
//       contenu: faker.lorem.sentences(10).join(' ')),
//   CommentaireModel(
//       identifiant: faker.randomGenerator.integer(10000).toString(),
//       auteur: usersData[random.integer(2, min: 0)],
//       date: faker.date.dateTime(),
//       idArticle: articlesData[14].id,
//       contenu: faker.lorem.sentences(10).join(' ')),
//   CommentaireModel(
//       identifiant: faker.randomGenerator.integer(10000).toString(),
//       auteur: usersData[random.integer(2, min: 0)],
//       date: faker.date.dateTime(),
//       idArticle: articlesData[14].id,
//       contenu: faker.lorem.sentences(10).join(' ')),
//   CommentaireModel(
//       identifiant: faker.randomGenerator.integer(10000).toString(),
//       auteur: usersData[random.integer(2, min: 0)],
//       date: faker.date.dateTime(),
//       idArticle: articlesData[14].id,
//       contenu: faker.lorem.sentences(10).join(' ')),
//   CommentaireModel(
//       identifiant: faker.randomGenerator.integer(10000).toString(),
//       auteur: usersData[random.integer(2, min: 0)],
//       date: faker.date.dateTime(),
//       idArticle: articlesData[14].id,
//       contenu: faker.lorem.sentences(10).join(' ')),
//   CommentaireModel(
//       identifiant: faker.randomGenerator.integer(10000).toString(),
//       auteur: usersData[random.integer(2, min: 0)],
//       date: faker.date.dateTime(),
//       idArticle: articlesData[13].id,
//       contenu: faker.lorem.sentences(10).join(' ')),
//   CommentaireModel(
//       identifiant: faker.randomGenerator.integer(10000).toString(),
//       auteur: usersData[random.integer(2, min: 0)],
//       date: faker.date.dateTime(),
//       idArticle: articlesData[13].id,
//       contenu: faker.lorem.sentences(10).join(' ')),
//   CommentaireModel(
//       identifiant: faker.randomGenerator.integer(10000).toString(),
//       auteur: usersData[random.integer(2, min: 0)],
//       date: faker.date.dateTime(),
//       idArticle: articlesData[13].id,
//       contenu: faker.lorem.sentences(10).join(' ')),
// ];
