module Loaders
  class AssociationLoader < GraphQL::Batch::Loader
    def self.validate(model, association_name)
      new(model, association_name)
      nil
    end

    def initialize(model, association_name)
      super(model, association_name)
      @model = model
      @association_name = association_name
      ## -> 下記のvalidateは、private method
      validate
    end

    def load(record)
      raise TypeError, "#{@model} loader can't load association for #{record.class}" unless record.is_a?(@model)

      return Promise.resolve(read_association(record)) if association_loaded?(record)

      super
    end

    def cache_key(record)
      record.object_id
    end

    def perform(record)
      preload_association(record)
      record.each { |rec| fulfill(rec, read_association(rec)) }
    end

    private

      def preload_association(records)
        ::ActiveRecord::Associations::Preloader.new.preload(records, @association_name)
      end

      def validate
        raise ArgumentError, "No association #{@association_name} on #{@model}" unless @model.reflect_on_association(@association_name)
      end

      def read_association(record)
        record.public_send(@association_name)
      end

      def association_loaded?(record)
        record.association(@association_name).loaded?
      end
  end
end
