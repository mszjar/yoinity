require 'faker'
require "open-uri"

puts "Destroying all posts and users..."
Post.destroy_all
User.destroy_all
puts "All posts and users destroyed!"

puts "Creating users..."
user1 = User.create!(email: "mario@email.com", password: "mario1234", nickname: "Mario", admin: true)
file =  URI.open("app/assets/images/avatar.png")
user1.photo.attach(io: file, filename: "avatar-mario.png", content_type: "image/png")
user1.save

user2 = User.create!(email: "marco@email.com", password: "marco1234", nickname: "Marco", admin: false)
file =  URI.open(Faker::Avatar.image)
user2.photo.attach(io: file, filename: "avatar-marco.png", content_type: "image/png")
user2.save

user3 = User.create!(email: "juan@email.com", password: "juan1234", nickname: "Juan", admin: false)
file =  URI.open(Faker::Avatar.image)
user3.photo.attach(io: file, filename: "avatar-juan.png", content_type: "image/png")
user3.save
puts "Users created!"

puts "Creating posts..."
file = URI.open("app/assets/images/attack_on_titan_wallpaper.gif")
post = Post.create!(
  title: "Attack on Titan Review by chatGTP",
  content: "\"Attack on Titan\" is a thrilling and captivating anime series that has captured the hearts of millions of fans worldwide. The show is set in a dystopian world where humanity is on the brink of extinction due to the Titans, monstrous humanoid creatures that devour humans without reason. The show's main protagonist, Eren Yeager, is determined to destroy the Titans and save humanity, but the path to achieving this goal is filled with unimaginable horrors and heartbreaking sacrifices.\r\n\r\nOne of the show's greatest strengths is its storytelling. The plot is complex, and the characters are well-developed, with each having their own unique motivations and backstories. The series also does an excellent job of building suspense and tension, keeping viewers on the edge of their seats.\r\n\r\nThe animation and visuals in \"Attack on Titan\" are also top-notch. The Titans are grotesque and intimidating, with their movements and behavior adding to their terrifying presence. The action scenes are fast-paced and intense, with fluid animation that makes the fights look realistic and thrilling.\r\n\r\nThe show's music is also noteworthy, with the hauntingly beautiful opening and ending themes complementing the dark and somber atmosphere of the series. The soundtrack during the action scenes is also well-crafted, adding to the excitement and tension.\r\n\r\nDespite all these strengths, the show does have its flaws. The pacing can be slow at times, and some episodes can feel like filler. The show also has a tendency to kill off major characters, which can be frustrating for viewers who have grown attached to them.\r\n\r\nOverall, \"Attack on Titan\" is a must-watch anime series that is sure to leave a lasting impression. With its gripping storytelling, stunning visuals, and memorable characters, it is no wonder why the series has become a cultural phenomenon.",
  url: "https://en.wikipedia.org/wiki/Attack_on_Titan",
  language: "English",
  user: user1
)
post.photo.attach(io: file, filename: "post1.jpg", content_type: "image/jpg")
post.save

file = URI.open("app/assets/images/tezos_wallpaper.jpg")
post = Post.create!(
  title: "Tezos, a blockchain that counts in the French crypto ecosystem.",
  content: "According to Deloitte's Web3 panorama, Tezos ranks 2nd in terms of usage among French blockchain infrastructure providers, behind the queen Ethereum. The French Web3 ecosystem is clearly dynamic. This explains the interest of multinationals in this industry in France, including Circle, which hopes to establish itself in 2023. But what exactly does this ecosystem look like? Deloitte and the Village by Crédit Agricole have taken an interest in this area, producing a panorama of French Web3 startups. This one focuses on the analysis of 205 startups, providers of blockchain infrastructure or financial services - and others as well. French Web3 covers the entire value chain The study, published earlier this month, thus finds that \"the proposed solutions cover the entire Web3 value chain.\" As in other countries, finance plays an important role. This has been and remains one of the most promising areas for crypto technologies. Deloitte notes that the ecosystem \"of French Web3 startups offering solutions related to financial services is very rich\". This is not the only French specialty, however. Infrastructure is another. Startups in this segment design, for example, essential products for exchanging digital assets between different blockchains, creating a digital identity, or enabling the tokenization of assets. Tezos 2nd behind Ethereum, but ahead of Bitcoin Web3 startups are leveraging different blockchain networks. The majority (80%) rely on the use of a single blockchain. The remaining 20% (mostly finance) have chosen to use multi-chain. Ethereum, the reference for decentralized applications and programmable contracts, has the lion's share in France. Of the twenty or so blockchains in use, Ethereum concerns 31% of Web3 projects. At 13%, Tezos is not just a figurehead, however, and is in second place. Entertainment (sports, gaming and art) constitutes a third pole within the French Web3 ecosystem. And if its first startups were born in 2010, the peak of creation is between 2020 and 2022, notes the study. 36% of NSPs, 44% of which are less than 3 years old In terms of targets, they stand out from the more traditional software sector in France, which is very focused on businesses (B2B). In fact, almost all of them are aimed at individuals (83%), compared with 17% for B2B. The separation between the two worlds is not totally watertight, however. 64% of startups target individuals directly and 36% do so via companies (B2B2C). Moreover, 30% of them target both individuals and companies. This dual positioning concerns more specifically investment solutions on or with digital assets. Simply put, these are essentially crypto finance startups. A promising crypto ecosystem Among the financial services providers, 36% are registered as PSANs with the AMF. Another interesting fact is that among PSANs: About one in two [companies] (44%) were founded less than 3 years ago. This demonstrates the dynamics of the ecosystem that has been initiated over the past few years,\" the authors comment. Finance is not the only outlet for French players. Deloitte reminds us that the ecosystem \"is in full development\". Thus, fundraising is concentrated on startups in early-stage. As a result, France has a \"pool of startups with significant development potential. 23% of startups in the study have 23% of the startups in the study have raised seed capital, while 51% have not raised any funds. More generally, the country \"leads the way in Web3 in Europe and has assets to play with on a global level. These include incubators, investors and a pool of talent.",
  url: "https://tezos.com/",
  language: "English",
  user: user2
)

post.photo.attach(io: file, filename: "post2.jpg", content_type: "image/jpg")
post.save

file = URI.open("app/assets/images/chatgpt_wallpaper.gif")
post = Post.create!(
  title: "Yoinity Growth 101: Skyrocket Your Following with These 10 Easy Steps",
  content: "Learn how I gained 200+ followers in just a week and how you can do it too!


  Creative in Space, AI, Futuristic.
  Are you ready to take your Yoinity game to the next level? In this article, I’ll share the exact steps I followed to grow my Yoinity following from 0 to over 200 in just a week! The secret? Consistently providing value. Follow these 10 simple steps and watch your audience expand before your eyes.

  Embrace Your Niche
  Discover your passion and let your niche find you. Write about topics you’re genuinely interested in and knowledgeable about, as this will keep both you and your audience engaged.

  Show Up Every Day
  Consistency is key. Make a commitment to post regularly and stick to it. This helps establish trust and keeps your followers coming back for more.

  Curate Recommendations
  Personalize your recommendations to showcase relevant content for your niche. This ensures you’re always providing value and staying current within your community.

  Engage with Others
  Like and comment on articles related to your niche. This not only builds relationships with fellow writers but also increases your visibility to potential followers.

  Borrow Their Audience
  Like and follow everyone who engages with popular articles in your niche. By showing genuine interest, you’ll pique their curiosity and entice them to check out your content.

  Write Daily
  Set a goal to write and publish one article a day. This helps build your portfolio and keeps your content fresh and engaging.

  Hook ‘Em with Headlines
  Invest as much time crafting your headline and subheading as you do on your article. A captivating title is crucial for drawing readers in.

  Utilize ChatGPT
  Leverage AI tools like ChatGPT to help brainstorm ideas, create outlines, and structure your articles. This can save time and keep your writing focused.

  Capture Attention with Visuals
  Use tools like Midjourney to create eye-catching visuals that grab readers’ attention and encourage them to keep scrolling.

  Write for One Person only
  Imagine you’re writing to a single individual. This personal touch helps forge a connection with your audience and makes your writing more relatable.

  Evoke Emotion
  Infuse your articles with emotion. Whether you’re exciting, educating, or providing value, make your readers feel something as they engage with your content.

  Be Strategic with Submissions
  Choose relevant topics when submitting your work. This increases the likelihood of your article being discovered by readers interested in your niche.

  Bonus Tip:
  Find trending posts with high exposure, and write a value-adding comment featuring a key point from your latest article. Mention that readers can find more information in your post, and watch the traffic roll in.

  TL;DR
  Embrace your niche
  Post consistently
  Curate relevant recommendations
  Engage with others in your niche
  Borrow audience from popular articles
  Write daily
  Craft captivating headlines
  Use ChatGPT for ideas and structure
  Create eye-catching visuals with Midjourney
  Write for one person
  Evoke emotion in your articles
  Be strategic with submissions
  Bonus: Leverage trending posts for visibility
  Growing your Yoinity following doesn’t have to be a mystery. By consistently providing value and following these 10 easy steps, you’ll be well on your way to amassing an engaged and loyal audience. Start implementing these strategies today and watch your Yoinity following soar!

  To join our engagement crew (and we’ll grow together):

  Follow me
  Like this article
  Comment on this article",
  url: "https://medium.com/@lkstimm/medium-growth-101-skyrocket-your-following-with-these-10-easy-steps-6f1c041dfe8e",
  language: "English",
  user: user2
)

post.photo.attach(io: file, filename: "post3.jpg", content_type: "image/jpg")
post.save

file = URI.open("app/assets/images/twitter_wallpaper.jpg")
post = Post.create!(
  title: "Cómo conseguir seguidores en Twitter?",
  content: "En este post primero empezaremos cambiando el chip sobre la red social “Twitter” y como conseguir de manera legal uno a uno seguidores, contaré un poco mi experiencia utilizando varias herramientas que surgieron y dieron un buen resultado.

  Todos conocemos Twitter, sabemos que tiene como logo un ave azul, donde el post debe tener máximo 140 caracteres, algunos no utilizan Twitter porque aún no le encuentran sentido. En mi caso, Twitter no era una de mis redes sociales preferidas, tenía una cuenta a la cual no le daba uso simple y sencillamente porque no lo entendía, Facebook no nos restringe el texto a publicar, puedes incluso poner toda una canción y todo estaría bien.


  Me ha tocado una tarea el cual era crecer los seguidores de Twitter, al principio se me hacía engorroso y difícil, no conocía Twitter en sí. Averiguando sobre el tema me di cuenta que profesionales destacados postean temas relevantes e interesantes, entonces aquí está la red donde puedes estar informado y actualizado.

  Herramientas para crecer seguidores en Twitter
  Así como en Facebook necesitas likes, en Youtube vistas y subscripciones, en Twitter necesitas seguidores y es un poco tedioso conseguirlas, aquí están especificadas y detalladas cada una.


  TweetDeck, una herramienta el cual te da la ventaja de realizar tweets a diferentes horas, te darás cuenta que uno tiene un sinfín de ideas por postear y lo haces todo a esa misma hora, eso se puede ver como si fuera un spam o de repente es el tiempo el que te perjudica, por ello, si quieres conseguir seguidores y no te dejen de seguir debes estar constantemente publicando, puedes programar los tweets a cualquier hora, administrar varias cuentas y tener control de lo publicado.

  Crowdfire, una herramienta donde tienes la administración, vista y monitoreo total de la cuenta; puedes observar las personas que no te siguen; tus fans; las personas que te han dejado de seguir (hay que mantener actualizado de información); a las personas que has seguido; seguir a personas, empresas, con palabras claves con a través de un #hashtag; las personas que has restringido en tu cuenta (A todos los faltosos), etc. Lo malo de esta herramienta es que no puedes hacer muchas interacciones de forma gratuita ya que es una herramienta de pago.

  Tweetpi, una herramienta donde te muestra la vista general según la búsqueda por medio de @ y el nombre las persona, grupo o empresa, es una buena forma de captar a las personas. Tiene un listado el cual te detalla el nombre del seguidor, locación, último día que a twitteado, cuantos seguidores posee y con qué frecuencia siguen, a mi punto de vista uno debe de tener en cuenta a quien seguir, sobre todo la parte donde te dice el último día que a twitteado, porque si no es una persona que twittea o no entra seguido a la red social, probablemente no te seguirá y también debes de tener en cuenta con qué frecuencia siguen, porque si no tienen la costumbre de seguir y solo postear no te sirve de nada este seguidor.

  NewsTop, una página donde se concentran las noticias, post, etc. Donde uno puede rescatar una de ellas y postearlas en twitter, claro, puedes utilizarla solo cuando te quedes sin ideas y estés al borde de la desesperación. Aquí encontrarás mayormente artículos en inglés, si tú tienes seguidores de habla español será cuestión que traduzcas por tu cuenta estos artículos y como no, darle tu estilo al momento de publicarlo.

  Te sigo y tú me sigues, lo dejo de último porque no es una buena manera de conseguir seguidores pero es una buena arma para conseguir seguidores de la noche a la mañana pero algunas veces es sin filtro, si quieres conseguir personas que en realidad quieres que lean lo que publiques, den su punto de vista o estén atentos a lo que está en los post no te recomiendo esta manera, lo puedes hacer casualmente.

  Estrategias para crecer en Twitter
  Son fundamentales y van de la mano con las herramientas ya mencionadas, te ayudará a focalizar de manera rápida el objetivo de crecimiento.


  Revisar los países donde no tienes gran impacto, puede que tu sigas a muchas personas pero no tienes un orden, ni la forma de saber dónde estás causando más impacto, aquí está Twitter Analytics para que puedas ver de manera general y particular todo el desarrollo de tu página.

  Generar post en un tema específico, cuando uno comienza a seguir, lo hacemos de manera desordenada, una buena estrategia es focalizar en un tema y comenzar a indagar en grupos específico, país donde este potenciando el tema o persona que sea destacada en el tema y captar a sus seguidores.

  Generar conversación con el seguidor, es muy recomendable ya que este seguidor va a sentir que no solo es una página que da posts como una metralleta, sino que se enfoca y busca lo mejor, hacer sentir que es importante lo que necesita y que en esta página le será de mucha ayuda.

  Espero que les haya gustado este post y estén atentos que estaré posteando nuevas cosas, por favor no olviden de dar sus comentarios, pues me será de mucha ayuda.",
  url: "https://medium.com/@takeshipaulo/como-conseguir-seguidores-en-twitter-d54b507ab23e",
  language: "Spanish",
  user: user2
)

post.photo.attach(io: file, filename: "post4.jpg", content_type: "image/jpg")
post.save

file = URI.open("app/assets/images/hacker.gif")
post = Post.create!(
  title: "Comment générer un revenu en développant seul son produit",
  content: "Indie hacker français, Jérôme Gangneux nous raconte comment il a développé et monétisé son produit “Thread Reader” en quelques semaines.

  Jérôme Gangneux, développeur français de Thread Reader, actuellement au Canada
  Salut Jérôme ! Tu veux bien te présenter ?

  Salut, je m’appelle Jérôme, j’ai 32 ans et je vis actuellement à Vancouver au Canada.

  Dans la vie, j’aime créer et expérimenter tout un tas de choses. Comme je suis développeur de formation, c’est avec le code que je m’exprime et que je construis plein de projets qui touchent à tout. De l’outil utilitaire qui résout un vrai problème aux pérégrinations artistiques avec l’art génératif.

  Tu as lancé Thread Reader il y a quelques mois, en solo. Peux-tu nous en dire plus sur ce produit ?

  Thread Reader est un service qui permet de lire et découvrir des Threads Twitter (un thread, dans notre cas, c’est une suite de Tweets liés entre eux qui parfois raconte une histoire).

  Ce service est principalement axé autour d’un bot Twitter avec lequel les utilisateurs peuvent interagir en lui demandant de grouper ces tweets sur une jolie page dédiée. Le but est de faciliter la lecture et le partage de ces threads.

  Qu’est-ce qui t’a amené à créer ton propre produit ?

  En réalité, avec Thread Reader, je voulais créer une série de vidéos et articles didactiques pour montrer par l’exemple au plus grand nombre qu’il est facile de lancer un projet numérique aujourd’hui. Thread Reader est en fait l’exemple concret que j’ai utilisé pour ces vidéos.

  Le projet a rapidement dépassé le cadre du simple exemple quand j’ai vu l’intérêt qu’il suscitait.


  Vidéos dans lesquelles Jérôme montre le développement de Thread Reader en guise d’exemple
  Pourquoi as-tu décidé de le développer seul ? Quelles ont été tes influences ?

  Historiquement, j’ai toujours voulu monter une startup, puis je me suis aperçu qu’en fait non, ce n’était pas vraiment ce que je voulais. Je veux simplement pouvoir travailler sur mes propres projets et résoudre par la même mes propres problèmes — tout relatifs.

  Actuellement, il existe une scène de ce qu’on peut appeler les solo-makers. Parmi ces personnes il y a notamment @levelsio qui est une figure emblématique (et source d’inspiration personnelle comme pour beaucoup, je crois)

  Ce que j’aime dans cette nouvelle mouvance c’est que les gens font du très bon travail sans se prendre trop au sérieux. L’ensemble fonctionne aussi grâce à un autre aspect plus dur à maîtriser pour les non anglos saxon : le no bullshit.

  Je crois que la nouvelle génération dont je tente de faire partie est bien plus bienveillante que les environnements de travail variés que j’ai pu connaître en France.

  À noter qu’ici au Canada, et de ma maigre expérience, les environnements de travail me semblent plus sains de base.

  Où en est Thread Reader, aujourd’hui ? As-tu quelques chiffres à partager avec nous ?

  Thread Reader se porte bien, la croissance est là, mais n’est pas folle. Je crois que c’est tant mieux, je reste sur une échelle humaine que je peux gérer petit à petit.

  Je tente de publier le plus de metrics possible : tous les mois je tiens les comptes en terme de visite sur mon Patreon. Pour Mars on a donc : 1,5 millions de pages vues et presque 700.000 utilisateurs.

  Thread Reader is creating a service to Discover and Read the Best of Twitter Threads | Patreon
  Thread Reader is a service that I made for myself because I was tired of reading these great Twitter threads with such…
  www.patreon.com

  En termes de revenu, il y a trois sources assez complémentaires.

  Les donations, ce avec quoi j’ai historiquement commencé : compte pour 40% des revenus.

  Les membres premium pour 40% des revenus et le reste est de la publicité classique et non intrusive : 20% des revenus.

  L’ensemble est très variable selon les mois, selon les buzz du moment. Pour mars le total est d’environ 2500 €.

  EDIT: Pour plus d’informations sur le développement et les métriques obtenues, consulter les articles suivants publiés par Jérôme:

  Thread Reader use case: From Idea to Launch
  Thread Reader use case: From Launch to Traction
  Thread Reader follow up: Daily Life of a Solo Maker
  Bien joué ! Dirais-tu que c’était difficile ou pénible d’atteindre un tel succès ?

  Pour le coup, tout s’est bien passé. C’est vrai que je n’avais pas pour but d’en arriver là, donc pas de déception. Et puis surtout c’est l’ensemble de mes précédents projets, une série assez conséquente d’échecs ou de tentatives plus ou moins abouties qui m’ont amené à ce résultat aujourd’hui. Sans cet historique, j’imagine que les choses auraient étés bien plus compliquées.

  Projets
  Liste d’idées
  docs.google.com

  Ce qui a été important aussi, c’est le support moral inconditionnel et la grande compréhension de la personne avec qui je partage ma vie. La pression sociale peut souvent vous faire douter, et dans mon cas, grâce à son soutien, j’ai pu y échapper en grande partie.

  Malheureusement il y aura toujours quelqu’un de l’ancien monde pour vous juger, il ne faut pas se laisser avoir.

  Qu’est-ce que tu as trouvé le plus excitant dans cette expérience ?

  C’était prévu avant Thread Reader mais j’ai quitté mon job de développeur à plein temps pour me lancer en solo. Vivre de son propre travail et expérimenter ses propres idées c’était un objectif personnel. De plus, sur un projet solo maîtrisé de bout en bout, il y a des retours rapides de la part des utilisateurs, et la faculté d’agir vite.

  Grâce à cette vitesse d’exécution, on peut être (ou non) récompensé en quasi temps réel (via le nombre de visiteurs ou même en terme d’entrés d’argent), ce qui reconnecte le travail et la réalité. C’est une expérience très intéressante, difficile à reproduire dans un environnement salarié.

  Évidemment, ça a aussi son côté négatif. On fait des erreurs qu’on peut payer cher et jamais à l’abris de coups de blues quand quelque choses ne marche pas.

  Quels enseignements retires-tu de cette expérience de création en solo ?

  En terme d’enseignement, je crois que Thread Reader est la preuve du message que je voulais faire passer avec mes vidéos : lancez-vous. Faites des choses.

  Et si vous ne savez pas comment vous y prendre : utilisez votre moteur de recherche favoris !

  Pour les aspects plus pratiques, je suis adepte de la méthode KISS (keep it simple stupid).

  Quel conseil donnerais-tu à ceux qui réfléchiraient à se lancer à leur tour ?

  Le mythe à briser, c’est clairement la culture du secret. Personne ne vous volera votre idée, alors plutôt que de tenter de tout faire en sous-marin, exposez tout sur la place publique.

  Vous aurez des retours rapidement, vous trouverez même sans doute une communauté prête à vous aider.

  Indie Hackers: Work Together to Build Profitable Online Businesses
  Connect with fellow entrepreneurs, developers, and bootstrappers who are sharing the strategies and revenue numbers…
  www.indiehackers.com

  En tant que personne introvertie (profil “INTJ”, comme moi !), quelle nuances apporterais-tu aux retours d’expériences et conseils qu’on peut lire sur indiehackers.com et autres ?

  J’ai lu dix mille fois que le marketing et la communication étaient super importants, et je ne pouvais qu’être d’accord avec ça. Clairement, mon point faible en tant que personne introvertie. Mais aujourd’hui, grâce à cette mouvance solo maker et no bullshit, j’ai pas besoin de me créer un personnage extraverti. Je communique comme je suis, j’utilise des canaux de communication plus intimistes, du one-one aussi.

  Quelles qualités liées à ta personnalité as-tu bien exploité ?

  En terme de qualité, je dirais sans doute la persévérance. Pas spécifiquement pour ce projet, mais pour l’ensemble des échecs précédents.

  Quels sont tes objectifs et envies pour l’avenir de Thread Reader ?

  Le but aujourd’hui avec Thread Reader est de pérenniser un peu les revenus. Aujourd’hui tout est trop dépendant du buzz du moment. La plupart des aspects du service sont automatisés. Je n’ai qu’à faire le support client, corriger des bugs.

  Ensuite il sera temps de passer au prochain projet car rien n’est éternel, ni Thread Reader, ni ma motivation.

  Qu’est-ce qu’on peut te souhaiter de beau pour la suite ?

  Je travaille sur un jeu vidéo pour mobile, c’est un hobby mais souhaitons-moi au moins de le rentabiliser :)

  Sinon, je vais continuer à aider les gens qui veulent se lancer, tranquillement à ma petite échelle. Sans doute via des articles de blog et de tutoriaux amateurs. Si un jour quelqu’un me contacte pour me dire que je l’ai aidé alors je crois que ma mission sera accomplie.

  Merci encore d’avoir partagé ce retour d’expérience avec nous, Jérôme !
  Excellente continuation à toi ! 🏋
  PS: et merci à ma chérie,
  Camille Betinyani Chacur
  , pour sa relecture !",
  url: "https://medium.com/@adrienjoly/comment-g%C3%A9n%C3%A9rer-un-revenu-en-d%C3%A9veloppant-seul-son-produit-6a05f32524bd",
  language: "French",
  user: user3
)

post.photo.attach(io: file, filename: "post5.jpg", content_type: "image/jpg")
post.save

puts "Finished!"
