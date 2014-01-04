class PacientesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_paciente, only: [:show, :edit, :update, :destroy]
  
  
  # GET /pacientes
  # GET /pacientes.json
  def index
    @pacientes = Paciente.search(params[:search]).order(created_at: :desc)
    #@pacientes = Paciente.all.order(created_at: :desc)
  end

  # GET /pacientes/1
  # GET /pacientes/1.json
  def show
  end

  # GET /pacientes/new
  def new
    @paciente = Paciente.new
    @all_users = User.all.map {|user| [user.username, user.id]}
    @estadocivil = %w(Casado(a) Solteiro(a) Divorciado(a) Viúvo(a) )
    @sexo = %w(Masculino Feminino)
    @action = "new"
  end

  # GET /pacientes/1/edit
  def edit
    @all_users = User.all.map {|user| [user.username, user.id]}
    @estadocivil = %w(Casado(a) Solteiro(a) Divorciado(a) Viúvo(a) )
    @sexo = %w(Masculino Feminino)
    @action = "edit"
  end

  # POST /pacientes
  # POST /pacientes.json
  def create
    @paciente = Paciente.new(paciente_params)
    #@paciente.user_id = current_user.id
    respond_to do |format|
      if @paciente.save
        format.html { redirect_to @paciente, notice: 'Paciente criado com sucesso!' }
        format.json { render action: 'show', status: :created, location: @paciente }
      else
        format.html { render action: 'new' }
        format.json { render json: @paciente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pacientes/1
  # PATCH/PUT /pacientes/1.json
  def update
    respond_to do |format|
      if @paciente.update(paciente_params)
        format.html { redirect_to @paciente, notice: 'Paciente atualizado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @paciente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pacientes/1
  # DELETE /pacientes/1.json
  def destroy
    @paciente.destroy
    respond_to do |format|
      format.html { redirect_to pacientes_url }
      format.json { head :no_content }
      format.js {head :ok}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_paciente
      @paciente = Paciente.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def paciente_params
      params.require(:paciente).permit(:nome, :cpf, :email, :idade, :sexo, :telf, :telc, :convenio, :ativo, :estadocivil, :user_id)
    end
end
