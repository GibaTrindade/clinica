class AnamnesesController < ApplicationController
  
  def show
      @anamnese = Anamnese.find(params[:id])
    end
  def new
    @paciente = Paciente.find(params[:paciente_id])
      @anamnese = @paciente.anamneses.build #Diagnostico.new
    end
  
  def create
    @paciente = Paciente.find(params[:paciente_id])
      #@diagnostico = @paciente.diagnosticos.build(diag_params)
      @anamnese = @paciente.anamneses.create(anam_params)
      if @anamnese.save
        redirect_to @anamnese,
                    notice: 'Cadastro criado com sucesso!'
  else
        render action: :new
      end
  end
  
  def edit
      #@paciente = Paciente.find(params[:paciente_id])
      @anamnese = Anamnese.find(params[:id])
      #@diagnostico = @paciente.diagnosticos.find(params[:id])
  end
  
  def update
    #@paciente = Paciente.find(params[:paciente_id])
    #@diagnostico = @paciente.diagnosticos.find(params[:id])
    
    #@diagnostico.update_attributes(diag_params)
    @anamnese = Anamnese.find(params[:id])
    if @anamnese.update(anam_params)
          redirect_to @anamnese,
            notice: 'Cadastro atualizado com sucesso!'
    else
          render action: :edit
        end
  end
  
  
  private
    def anam_params
      params.
        require(:anamnese).
        permit(:queixa)
  end
    # in new action
  #@diagnostico = @paciente.bars.build

    # in create action
  #@diagnostico = @paciente.bars.create(diag_params)

    # in edit action
  #@diagnostico = @paciente.bars.find(params[:id])

    # in update action
  #@diagnostico = @paciente.bars.find(params[:id])
  #@diagnostico.update_attributes(diag_params)
  
end
