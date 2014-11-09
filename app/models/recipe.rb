class Recipe < ActiveRecord::Base
  has_attached_file :image
 
  has_many :procedures
  has_many :values

  class << self
    def search(search)
      logger.debug("search")
      where_chain = nil;
      if search
        logger.debug("search #{search}")
        where_cahin = (where_chain || self).where(['name LIKE ?', "%#{search}%"])
      else
        logger.debug("search all")
        where_chain = (where_chain || self).all
      end
      where_chain
    end
  end


end
