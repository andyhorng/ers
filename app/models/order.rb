class Order < ActiveRecord::Base
  validates_presence_of :sid, :sclass, :name, :phone, :odatetime
  validates_format_of :odatetime, :with => /\d\d\d\d-\d\d-\d\d \d\d:\d\d/
  validates_uniqueness_of :odatetime
  before_save :set_odatetime
  private
  def set_odatetime
    if odatetime == String
      odatetime = DateTime.strptime(datetime, "%Y-%m-%d %H:%M")
    end
  end
end
