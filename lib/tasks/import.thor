require 'find'

class TdnmCli < Thor
  desc 'import', 'import from middleman blog'
  def import(base_dir)
    require './config/environment'

    entries = Find.find("#{base_dir}/source").grep(/\d{4}-\d{2}-\d{2}-*/).map {|e|
      a = YAML.load_file(e)
      a["body"] = File.read(e).gsub(/---.+---\s+/m, '')
      a["url_title"] = e.match(/\d{4}-\d{2}-\d{2}-([^-].+?)\./)[1]
      a
    }

    Article.transaction do
      entries.each do |e|
        Article.create!(
          title: e["title"],
          url_title: e["url_title"],
          body: e["body"],
          published_on: e["date"]
        )
      end
    end
  end
end
