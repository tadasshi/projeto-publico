base_url = "http://#{request.host_with_port}"
xml.instruct! :xml, :version => '1.0'
xml.tag! 'urlset', 'xmlns' => 'http://www.sitemaps.org/schemas/sitemap/0.9' do
  xml.url {
    xml.loc('http://masteringpnl.com')
    xml.changefreq('weekly')
    xml.priority(1.0)
  }
  xml.url {
    xml.loc('http://masteringpnl.com/posts')
    xml.changefreq('daily')
    xml.priority(0.9)
  }
  xml.url {
    xml.loc('http://masteringpnl.com/bibliographies')
    xml.changefreq('daily')
    xml.priority(0.9)
  }
  xml.url {
    xml.loc('http://masteringpnl.com/metaphors')
    xml.changefreq('daily')
    xml.priority(0.9)
  }
  xml.url {
    xml.loc('http://masteringpnl.com/ebooks')
    xml.changefreq('daily')
    xml.priority(0.9)
  }
  xml.url {
    xml.loc('http://masteringpnl.com/sobre-nos')
    xml.changefreq('monthly')
    xml.priority(0.5)
  }
  xml.url {
    xml.loc('http://masteringpnl.com/contato')
    xml.changefreq('monthly')
    xml.priority(0.5)
  }
  @bibliographies.each do |bibliography|
    xml.url {
      xml.loc "#{bibliography_url(bibliography)}"
      #xml.lastmod bibliography.updated_at.strftime("%F")
      xml.changefreq('weekly')
      xml.priority(0.5)
    }
  end
  @ebooks.each do |ebook|
    xml.url {
      xml.loc "#{ebook_url(ebook)}"
      #xml.lastmod ebook.updated_at.strftime('%F')
      xml.changefreq('weekly')
      xml.priority(0.5)
    }
  end
  @metaphors.each do |metaphor|
    xml.url {
      xml.loc "#{metaphor_url(metaphor)}"
      #xml.lastmod metaphor.updated_at.strftime('%F')
      xml.changefreq('weekly')
      xml.priority(0.5)
    }
  end
  @posts.each do |post|
    xml.url {
      xml.loc "#{post_url(post)}"
      #xml.lastmod post.updated_at.strftime('%F')
      xml.changefreq('weekly')
      xml.priority(0.5)
    }
  end
end