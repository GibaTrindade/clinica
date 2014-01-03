class ExamesController < ApplicationController
  before_filter :authenticate_user!
  def index
    @paciente = Paciente.find(params[:paciente_id])
    @exames = @paciente.exames
  end
  
  def show
      @exame = Exame.find(params[:id])
    end
  def new
    @paciente = Paciente.find(params[:paciente_id])
      @exame = @paciente.exames.build #Diagnostico.new
    end
  
  def create
    @paciente = Paciente.find(params[:paciente_id])
      #@diagnostico = @paciente.diagnosticos.build(diag_params)
      @exame = @paciente.exames.create(exame_params)
      @exame.user_id = current_user.id
      if @exame.save
        redirect_to @exame,
                    notice: 'Cadastro criado com sucesso!'
  else
        render action: :new
      end
  end
  
  def edit
      #@paciente = Paciente.find(params[:paciente_id])
      @exame = Exame.find(params[:id])
      #@diagnostico = @paciente.diagnosticos.find(params[:id])
  end
  
  def update
    #@paciente = Paciente.find(params[:paciente_id])
    #@diagnostico = @paciente.diagnosticos.find(params[:id])
    
    #@diagnostico.update_attributes(diag_params)
    @exame = Exame.find(params[:id])
    if @exame.update(exame_params)
          redirect_to @exame,
            notice: 'Cadastro atualizado com sucesso!'
    else
          render action: :edit
        end
  end
  
  
  private
    def exame_params
      params.
        require(:exame).
        permit(:nome, :resultado, :unidade, :user_id)
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
