namespace :upwork do
  require 'open-uri'
  require 'nokogiri'
  task rails: :environment do
   # run rails jobs
    url = 'https://www.upwork.com/ab/feed/jobs/rss?contractor_tier=1&q=Ruby+on+Rails&sort=create_time+desc&api_params=1'
    open(url) do |rss|
      feed = Nokogiri::XML(rss)
      feed.xpath('//item').each do |item|
        title = item.xpath('title').text.sub(" - Upwork", "")
        href = item.xpath('link').text
        description = item.xpath('description').text.gsub(/\<.*\>/, " ").gsub(/\n/, "")
        date = item.xpath('pubDate').text.gsub(/ \+0000/, "")
        
        UpworkRail.create do |x|
          x.title = title
          x.href = href
          x.description = description
          x.date = date
        end
      end
    end
      
      UpworkRail.create do |x|
        x.title = title
        x.href = link
        x.description = description
        x.date = date
      end
    end
<<<<<<<<< saved version

=========
    #   UpworkRail.create do |x|
    #     x.title = @title
    #     x.href = @link
    #     x.description = @description
    #     x.date = @date
    #   end
    #   @row += 1
    # end
>>>>>>>>> local version
    
    UpworkRail.where("created_at < ?", (Time.now - 10.minutes)).destroy_all
  end
    
  task scrape: :environment do
    #run for scrape jobs
    url = 'https://www.upwork.com/ab/feed/jobs/rss?contractor_tier=1&q=Web+scraping&sort=create_time+desc&api_params=1'
    open(url) do |rss|
      feed = Nokogiri::XML(rss)
      feed.xpath('//item').each do |item|
        title = item.xpath('title').text.sub(" - Upwork", "")
        href = item.xpath('link').text
        description = item.xpath('description').text.gsub(/\<.*\>/, " ").gsub(/\n/, "")
        date = item.xpath('pubDate').text.gsub(/ \+0000/, "")
        
        UpworkScrape.create do |x|
          x.title = title
          x.href = href
          x.description = description
          x.date = date
        end
      end
    end
    
    UpworkScrape.where("created_at < ?", (Time.now - 10.minutes)).destroy_all
  end
  
  task ruby: :environment do
<<<<<<<<< saved version
    #run for ruby jobs
    url = 'https://www.upwork.com/ab/feed/jobs/rss?contractor_tier=1&q=Ruby&sort=create_time+desc&api_params=1'
    open(url) do |rss|
      feed = Nokogiri::XML(rss)
      feed.xpath('//item').each do |item|
        title = item.xpath('title').text.sub(" - Upwork", "")
        href = item.xpath('link').text
        description = item.xpath('description').text.gsub(/\<.*\>/, " ").gsub(/\n/, "")
        date = item.xpath('pubDate').text.gsub(/ \+0000/, "")
        
        UpworkRuby.create do |x|
          x.title = title
          x.href = href
          x.description = description
          x.date = date
        end
=========
    open(url) do |rss|
      feed = Nokogiri::XML(rss)
      feed.xpath('//item').each do |item|
        title = item.xpath('title').text.sub(" - Upwork", "")
        href = item.xpath('link').text
        description = item.xpath('description').text.gsub(/\<.*\>/, " ").gsub(/\n/, "")
        date = item.xpath('pubDate').text.gsub(/ \+0000/, "")
        
        UpworkScrape.create do |x|
          x.title = title
          x.href = href
          x.description = description
          x.date = date
        end
      end
    end
    
    UpworkScrape.where("created_at < ?", (Time.now - 10.minutes)).destroy_all
  end
  
  task ruby: :environment do
      @title = @rows[@row].elements.children[0].text.sub(" - Upwork", "") #title
      @link = @rows[@row].elements.children[1].text #link
      @description = @rows[@row].elements.children[2].text.gsub(/\<.*\>/, " ").gsub(/\n/, "") #description
      @date = @rows[@row].elements.children[4].text.gsub(/ \+0000/, "")
      
      UpworkScrape.create do |x|
        x.title = @title
        x.href = @link
        x.description = @description
        x.date = @date
      end
      @row += 1
    end
    
    UpworkScrape.where("created_at < ?", (Time.now - 10.minutes)).destroy_all
  end
  
  task ruby: :environment do
<<<<<<<<< saved version

=========
  require 'mechanize'
>>>>>>>>> local version
  
  #run for ruby jobs
  
  @a = Mechanize.new
  @a.user_agent_alias = 'Mac Safari 4'
  @page = @a.get('https://www.upwork.com/ab/feed/jobs/rss?contractor_tier=1&q=Ruby&sort=create_time+desc&api_params=1')
  @rows = @page.search('item')
  @row = 0
    while @row < @rows.count
      @title = @rows[@row].elements.children[0].text.sub(" - Upwork", "") #title
      @link = @rows[@row].elements.children[1].text #link
      @description = @rows[@row].elements.children[2].text.gsub(/\<.*\>/, " ").gsub(/\n/, "") #description
      @date = @rows[@row].elements.children[4].text.gsub(/ \+0000/, "")
      
      UpworkRuby.create do |x|
        x.title = @title
        x.href = @link
        x.description = @description
        x.date = @date
>>>>>>>>> local version
      end
    end
    
    UpworkRuby.where("created_at < ?", (Time.now - 10.minutes)).destroy_all
  end
    
end