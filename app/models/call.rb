class Call < ActiveRecord::Base

  belongs_to :user
  belongs_to :contact
  belongs_to :call_location

  attr_accessible :user_id, :contact_id, :call_start, :call_end, :call_reason, :call_notes, :call_location_id, :call_type

  def self.search(search, page)
    paginate :per_page => 25, :page => page,
             :conditions => ['name like ?', "%#{search}%"],
             :order => 'id DESC'
  end

end
