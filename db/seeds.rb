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

user2 = User.create!(email: "rober@email.com", password: "rober1234", nickname: "rober", admin: false)
file =  URI.open(Faker::Avatar.image)
user2.photo.attach(io: file, filename: "avatar-rober.png", content_type: "image/png")
user2.save
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
puts "Finished!"
