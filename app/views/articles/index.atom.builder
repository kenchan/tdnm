atom_feed(language: 'ja_JP') do |feed|
  feed.title(weblog.title)
  feed.updated(@articles[0].created_at) if @articles.length > 0

  @articles.each do |a|
    feed.entry(a, url: article_url(a)) do |entry|
      entry.title(a.title)
      entry.content(a.body, type: 'html')

      entry.author do |author|
        author.name("Kenichi TAKAHASHI")
      end
    end
  end
end