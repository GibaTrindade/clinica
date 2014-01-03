class DiagnosticosController < ApplicationController
  before_filter :authenticate_user!
  def index
    @paciente = Paciente.find(params[:paciente_id])
    @diagnosticos = @paciente.diagnosticos
  end
  
  def show
      @diagnostico = Diagnostico.find(params[:id])
    end
  def new
    @paciente = Paciente.find(params[:paciente_id])
      @diagnostico = @paciente.diagnosticos.build #Diagnostico.new
    end
  
  def create
    @paciente = Paciente.find(params[:paciente_id])
      #@diagnostico = @paciente.diagnosticos.build(diag_params)
      @diagnostico = @paciente.diagnosticos.create(diag_params)
      @diagnostico.user_id = current_user.id
      if @diagnostico.save
        redirect_to @diagnostico,
                    notice: 'Cadastro criado com sucesso!'
  else
        render action: :new
      end
  end
  
  def edit
      #@paciente = Paciente.find(params[:paciente_id])
      @diagnostico = Diagnostico.find(params[:id])
      #@diagnostico = @paciente.diagnosticos.find(params[:id])
  end
  
  def update
    #@paciente = Paciente.find(params[:paciente_id])
    #@diagnostico = @paciente.diagnosticos.find(params[:id])
    
    #@diagnostico.update_attributes(diag_params)
    @diagnostico = Diagnostico.find(params[:id])
    if @diagnostico.update(diag_params)
          redirect_to @diagnostico,
            notice: 'Cadastro atualizado com sucesso!'
    else
          render action: :edit
        end
  end
  
  
  private
    def diag_params
      params.
        require(:diagnostico).
        permit(:nome, :cid, :estado, :password, :user_id)
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