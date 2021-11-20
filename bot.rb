require 'nokogiri'
require 'open-uri'

best_buy = { 
    list_view: "https://www.bestbuy.com/site/xbox-series-x-and-s/xbox-series-x-and-s-consoles/pcmcat1586900952752.c?id=pcmcat1586900952752",    
    halo_edition: "https://www.bestbuy.com/site/microsoft-xbox-series-x-halo-infinite-limited-edition-black/6477938.p?skuId=6477938",
    halo_absolute_xpath: "/html[1]/body[1]/div[3]/main[1]/div[2]/div[3]/div[2]/div[1]/div[1]/div[14]/div[2]/div[1]/div[1]/div[1]/button[1]",
    halo_relative_xpath: "//button[@class='c-button c-button-disabled c-button-lg c-button-block add-to-cart-button']"
}

walmart = {
    regular_edition: "https://www.walmart.com/ip/Xbox-Series-X-Video-Game-Console-Black/443574645?athbdg=L2000",
    regular_rel_xpath: "//div[@class='bg-navy bb bw2 br2 white b--gold pa3 shadow-2 f6']"
}
microsoft = {}
costco = {}
gamestop = {}
target = {
    halo_edition: "https://www.target.com/p/xbox-series-x-halo-infinite-limited-edition-bundle/-/A-84169784",
    xpath: "/html/body/div[1]/div/div[4]/div/div[2]/div[3]/div[1]/div/div/div",
    xpath2: "//div[@class='h-text-orangeDark']",
    css: ".h-text-orangeDark"
}


def check_best_buy(best_buy)
    puts "Checking BestBuy..."
    http = URI.open best_buy[:halo_edition]
    doc = Nokogiri::HTML(http)

    if doc.xpath( best_buy[:halo_relative_xpath] ).inner_html != "Sold Out"
        puts "Best buy has 1!"
    end
end

def check_walmart(walmart)
    puts "Checking Walmart..."
    http = URI.open walmart[:regular_edition]
    doc = Nokogiri::HTML(http)
    
    puts doc.xpath( walmart[:regular_rel_xpath] ).inner_html
end

check_best_buy best_buy
check_walmart walmart