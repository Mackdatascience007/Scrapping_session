require 'rubygems'
require 'nokogiri'   
require 'open-uri'
require 'pry'

PAGE_URL = "https://coinmarketcap.com/all/views/all/"

def symbol
    symb_array = []
    page = Nokogiri::HTML(open(PAGE_URL))
    symbol = page.xpath('//*[@class="text-left col-symbol"]')
        symbol.each do |node|
            symb_array << node.text
    end
    return symb_array
end

def price
    price_array = []
    page = Nokogiri::HTML(open(PAGE_URL))
    symbol = page.xpath('//*[@class="price"]')
        symbol.each do |node|
            price_array << node.text.delete_prefix!("$")
    end
    return price_array
end

def hash_join(array_1,array_2)
    #crypto_hash = [symbol_array,price_array].transpose.to_h
    array_final = []
    array_2.size.times do |i|  
    array_final << {array_1[i] => array_2[i]}
    end
    return array_final
end

def perform
    array_1 = symbol
    array_2 = price
    array_hash = hash_join(array_1,array_2)
    print array_hash
end


  perform

