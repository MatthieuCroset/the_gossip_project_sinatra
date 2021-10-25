
class Gossip
attr_accessor :author, :content
  def initialize(author, content)
    @author = author
    @content = content
  end  

  def save
      CSV.open('./db/gossip.csv', 'ab') do |row|
        row << [@author, @content]
      end
  end

  def self.all
    all_gossips = []
    CSV.read("./db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    return all_gossips
  end

  def self.find(id)
    id = id.to_i + 1
    all_gossips = []
    CSV.read("./db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    return all_gossips[id]
    end
  end


end
