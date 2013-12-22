json.array!(@pacientes) do |paciente|
  json.extract! paciente, :id, :nome, :cpf, :email, :idade, :sexo, :telf, :telc, :convenio, :ativo, :estadocivil
  json.url paciente_url(paciente, format: :json)
end
