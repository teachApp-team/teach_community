class Topic < ApplicationRecord
    validates :site_name,  presence: true
    validates :title,  presence: true, uniqueness: true
    validates :content,  presence: true
    validates :link_url,  presence: true
    
    require 'mechanize'
    
    def self.scrape
      agent = Mechanize.new                  #agentは任意の変数
      page = agent.get(TopicSite.first.base_url)  #pageは任意の変数 getの引数はサイトのURL
      elements = page.search('a.kn-link.-forward') #div.idxcol aは取得したい要素  elementsは任意の変数
      cnt = 0
      elements.each do |element|
        cnt += 1
        new_topic = Topic.new(
          site_name: "河合塾",
          title: element.inner_text,
          content: "特になし",
          link_url: element.attr("href")
        )
      end
    end
    def self.scrape_sundai
      agent = Mechanize.new                  #agentは任意の変数
      page = agent.get("https://www2.sundai.ac.jp/yobi/sv/news/index.html")  #pageは任意の変数 getの引数はサイトのURL
      elements = page.search('dl dd a') #div.idxcol aは取得したい要素  elementsは任意の変数
      cnt = 0
      eles = []
      elements.each do |element|
        cnt += 1
        eles.push(element.inner_text)
      end
      eles
    end
end
