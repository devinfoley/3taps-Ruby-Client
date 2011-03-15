class Category < SuperModel::Base
  attributes :group, :category, :code, :annotations
  def annotations=(annotations)
    @attributes[:annotations] = annotations || []
  end

  def self.from_json(json)
    res = []

    json.each do |category|
      cat = Category.new({
          :group       => category["group"],
          :category    => category["category"],
          :code        => category["code"]
        })
      anns = []
      if category["annotations"] != nil
        category["annotations"].each do |annotation|
          ann = Annotation.new({
              :name            => annotation["name"],
              :annotation_type => annotation["type"]
            })
          opts = []
          if annotation["options"] != nil
            annotation["options"].each do |annotation_option|
              if annotation_option["value"] != nil
                opts << AnnotationOption.new({
                    :value => annotation_option["value"],
                    #:sub_annotation => annotation_option["sub_annotation"]
                  })
              end
            end
            ann.options = opts
            anns << ann
          end
        end
        cat.annotations = anns
      end
      res << cat
    end
    res
  end
end
