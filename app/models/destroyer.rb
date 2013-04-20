module Destroyer
  def destroy
    if Rails.env=='development'
      self.all.to_a.each do |u|
        u.destroy
      end
      puts "New count:#{self.count}"
    else
      puts "Are you crazy? This ain't development man!"
    end
  end
end