require 'rubygems'
require 'nokogiri'   
require 'open-uri'
require 'pry'

PAGE_URL = "http://annuaire-des-mairies.com/val-d-oise.html"

def villes_du_95
    villes_array = []
    page = Nokogiri::HTML(open(PAGE_URL))
     = page.xpath('//*[@class="lientext"]')
        villes.each do |node|
            villes_array << node["href"]
        end
    return villes_array
end

# def emails
#     emails_array = []
#     page = Nokogiri::HTML(open(PAGE_URL))
#     email = page.xpath('//td[contains(text(),'Adresse Email')]')   
#         email.each do |node|
#             emails_array << node.text
#         end
#     return emails_array
# end

def hash_join(array_1,array_2)
    #crypto_hash = [symbol_array,price_array].transpose.to_h
    array_final = []
    array_2.size.times do |i|  
    array_final << {array_1[i] => array_2[i]}
    end
    return array_final
end

def perform
    array_1 = villes_du_95
    array_2 = emails
    array_hash = hash_join(array_1,array_2)
    print array_hash
end



