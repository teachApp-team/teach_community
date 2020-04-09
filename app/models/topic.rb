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
    def self.scrape_tousin
      agent = Mechanize.new                  #agentは任意の変数
      page = agent.get("https://www.toshin.com/news/list.php?category=top")  #pageは任意の変数 getの引数はサイトのURL
      elements = page.search('ul.category-headline > li > a') #div.idxcol aは取得したい要素  elementsは任意の変数
      cnt = 0
      eles = []
      elements.each do |element|
        cnt += 1
        url_array = element.attr("href").split('')
        b_url = url_array.select do |u|
          u != "." && u != "/"
        end
        t_url = b_url.join
        tousin_url = "https://www.toshin.com/news/" + t_url
        new_topic = Topic.new(
            site_name: "東進ハイスクール",
            title: element.inner_text,
            content: "特になし",
            link_url: tousin_url
        )
        if new_topic.save
          
        else
          warn '保存できませんでした。'
        end
        eles.push(element)
      end
      eles
    end
    def self.scrape_sundai
      agent = Mechanize.new                  #agentは任意の変数
      page = agent.get("https://www2.sundai.ac.jp/yobi/sv/index.html")  #pageは任意の変数 getの引数はサイトのURL
      elements = page.search('dl.Top_topic-dl > dd > a') #div.idxcol aは取得したい要素  elementsは任意の変数
      cnt = 0
      eles = []
      elements.each do |element|
        cnt += 1
        if element.attr("href").include?("http")
          new_topic = Topic.new(
            site_name: "駿台",
            title: element.inner_text,
            content: "特になし",
            link_url: element.attr("href")
          )
        else
          sundai_url = "https://www2.sundai.ac.jp" + element.attr("href")
          new_topic = Topic.new(
            site_name: "駿台",
            title: element.inner_text,
            content: "特になし",
            link_url: sundai_url
          )
        end
        if new_topic.save
        else
          warn '保存できませんでした。'
        end
        eles.push(element)
      end
      eles
    end
end
