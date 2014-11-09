class Recipe < ActiveRecord::Base
  has_attached_file :image,
                    :styles => {
                      :thumb => "160x200",
                      :image => "350x400"
                    }

  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
 
  has_many :procedures, :dependent => :destroy
  has_many :values, :dependent => :destroy

  class << self
    def search(search)
      logger.debug("search")
      if search
        logger.debug("search #{search}")
        Recipe.where(['name LIKE ?', "%#{search}%"])
      else
        logger.debug("search all")
        Recipe.all
      end
    end
  end


end
