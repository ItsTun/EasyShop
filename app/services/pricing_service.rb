class PricingService
  def call
    path = Rails.root.join('db', 'seeds', 'pricings.txt')
    puts "Seeding file #{path}"
    File.open(path).read.each_line do |line|
      id, name, price, unit, description = line.chomp.split("|")
      begin
        pricing = Pricing.find(id)
        pricing.update(name: name, price: price, unit: unit, description: description)
      rescue ActiveRecord::RecordNotFound
        pricing = Pricing.create! id: id, name: name, price: price, unit: unit, description: description
      end
      puts "Pricing #{pricing.id} name: #{pricing.name}, price: #{pricing.price}, unit: #{pricing.unit}, description: #{pricing.description}"
    end
  end
end
