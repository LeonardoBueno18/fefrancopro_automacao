module Factory
  class Static
    def self.static_file(file)
      YAML.load_file("features/support/factory/static/#{file}.yml")
    end
  end
end
