require 'nokogiri'

best_buy = { 
    list_view: "https://www.bestbuy.com/site/xbox-series-x-and-s/xbox-series-x-and-s-consoles/pcmcat1586900952752.c?id=pcmcat1586900952752",    
    halo_edition: "https://www.bestbuy.com/site/microsoft-xbox-series-x-halo-infinite-limited-edition-black/6477938.p?skuId=6477938",
    halo_absolute_xpath: "/html[1]/body[1]/div[3]/main[1]/div[2]/div[3]/div[2]/div[1]/div[1]/div[14]/div[2]/div[1]/div[1]/div[1]/button[1]",
    halo_relative_xpath: "//button[@class='c-button c-button-disabled c-button-lg c-button-block add-to-cart-button']"
}

walmart = {}
microsoft = {}
costco = {}

http = URI.open best_buy[:halo_edition]
doc = Nokogiri::HTML(http)

if doc.xpath( best_buy[:halo_relative_xpath] ).inner_html == "Sold Out"
    puts "Sold out :("
end