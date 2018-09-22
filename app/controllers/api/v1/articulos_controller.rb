module Api
    module V1
        class ArticulosController < ApplicationController
            def index
                articulos = Articulo.order('created_at DESC')
                render json: {status: 'SUCCESS', message:'Ariculos Cargados', data:articulos}, status: :ok
            end

            def show
                articulos = Articulo.find(params[:id])
                render json: {status: 'SUCCESS', message:'Ariculos Cargados', data:articulos}, status: :ok
            end
            def create
                articulo = Articulo.new(articulo_params)
                if articulo.save
                    render json: {status: 'SUCCESS', message:'Ariculo Guardado', data:articulo}, status: :ok
                else
                    render json: {status: 'ERROR', message:'Ariculo NO Guardado', data:articulo.errors}, status: :ok
                end
            end

            def update
                articulo = Articulo.find(params[:id])
                if articulo.update_attributes(articulo_params)
                    render json: {status: 'SUCCESS', message:'Ariculo Actualizado', data:articulo}, status: :ok
                else
                    render json: {status: 'ERROR', message:'Ariculo NO Actualizado', data:articulo.errors}, status: :umprocessable_entity
                end
            end
            def destroy
                articulo = Articulo.find(params[:id])
                articulo.destroy
                render json: {status: 'SUCCESS', message:'Ariculos Eliminado', data:articulo}, status: :ok
            end
            private
            def articulo_params
                params.permit(:titulo,:cuerpo)
            end
        end
    end
end