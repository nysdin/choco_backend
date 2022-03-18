module MerchandiseServices
  class FetchAllMerchandisesService
    def execute
      MerchandiseRepository.new.fetch_all_merchandises
    end
  end
end
