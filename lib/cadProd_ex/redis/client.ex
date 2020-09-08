defmodule CadProdEx.Redis.Client do

	def start_redis do
		{:ok, _} = Redix.start_link("redis://localhost:6379", name: :redix)
	end
	

	def get(key) do 
		Redix.command!(:redix, ["GET", key])
	end	


    def set(key, payload), do: Redix.command!(:redix, ["SET", key, payload])
    

    
    def delete(key) do
    	Redix.command!(:redix,["DEL", key])
    end

    defp config, do: Application.get_env(:CadProd_ex, __MODULE__)
end