# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ title: 'Star Wars' }, { title: 'Lord of the Rings' }])
#   Character.create(title: 'Luke', movie: movies.first)

foods = Product.create([
  {
    title: "Mì spaghetti sốt kem nấm",
    product_type: 'food', price: 99000,
    image_url:
      "https://img.tastykitchen.vn/crop/320x250/2021/11/02/my-y-kem-nam-2-b720.jpg",
  },
  {
    title: "Mì spaghetti sốt cà chua bacon",
    product_type: 'food', price: 99000,
    image_url:
      "https://img.tastykitchen.vn/crop/320x250/2021/11/02/my-y-ca-chua-2-616f.jpg",
  },
  {
    title: "Mì spaghetti sốt bò bằm",
    product_type: 'food', price: 99000,
    image_url:
      "https://img.tastykitchen.vn/crop/320x250/2021/11/02/my-y-bo-bam-2-59b9.jpg",
  },
  {
    title: "Cháo tôm",
    product_type: 'food', price: 95000,
    image_url:
      "https://img.tastykitchen.vn/crop/320x250/2021/06/02/chao-tom-dc62.jpg",
  },
  {
    title: "Ba rọi chiên mắm ngò",
    product_type: 'food', price: 175000,
    image_url:
      "https://img.tastykitchen.vn/crop/320x250/2021/01/25/ba-roi-mam-ngo-1280x1000-9503.jpg",
  },
  {
    title: "Sụn gà xóc muối Tây Ninh",
    product_type: 'food', price: 135000,
    image_url: "https://img.tastykitchen.vn/crop/320x250/2020/11/17/2-d84e.jpg",
  },
  {
    title: "Chả giò pate (Ready to cook)",
    product_type: 'food', price: 104000,
    image_url:
      "https://img.tastykitchen.vn/crop/320x250/2021/09/22/cha-gio-pate-b075.jpg",
  },
  {
    title: "Bò hầm củ cải (Ready to cook)",
    product_type: 'food', price: 184000,
    image_url:
      "https://img.tastykitchen.vn/crop/320x250/2021/09/22/bo-ham-cu-cai-d38b.jpg",
  },
  {
    title: "[Ready to cook] Nem lụi nướng mía",
    product_type: 'food', price: 148000,
    image_url:
      "https://img.tastykitchen.vn/crop/320x250/2021/11/02/nem-lui-nuong-mia-2-38b3.jpg",
  },
  {
    title: "Sườn heo nướng ngũ vị (Ready to cook)",
    product_type: 'food', price: 234000,
    image_url:
      "https://img.tastykitchen.vn/crop/320x250/2021/09/23/suon-nuong-ngu-vi-f2cc.jpg",
  },
  {
    title: "Giò heo hầm pate (Ready to cook)",
    product_type: 'food', price: 228000,
    image_url:
      "https://img.tastykitchen.vn/crop/320x250/2021/09/15/tasty-mockupfood-1280x1000-01-min-6ae9.png",
  },
  {
    title: "Cà ri gà (Ready to cook)",
    product_type: 'food', price: 154000,
    image_url:
      "https://img.tastykitchen.vn/crop/320x250/2021/09/23/ca-ri-ga-0946.jpg",
  },
  {
    title: "Ức gà chiên xù (Ready to cook) ",
    product_type: 'food', price: 158000,
    image_url:
      "https://img.tastykitchen.vn/crop/320x250/2021/09/15/tasty-mockupfood-1280x1000-13-f29a.png",
  },
  {
    title: "Giò thủ TASTY",
    product_type: 'food', price: 48000,
    image_url:
      "https://img.tastykitchen.vn/crop/320x250/2021/09/22/gio-thu-0d47.jpg",
  },
]);