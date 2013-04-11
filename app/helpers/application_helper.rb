module ApplicationHelper
	def mexico_states
    mexico_states = ['Aguascalientes', 'Baja California Norte', 'Baja California Sur', 'Campeche', 
              'Coahuila', 'Colima', 'Chiapas', 'Chihuahua', 'Durango', 'Estado de Mexico', 'Guanajuato', 
              'Guerrero', 'Hidalgo', 'Jalisco', 'Michoacan', 'Morelos', 'Distrito Federal', 'Nayarit',
              'Nuevo Leon', 'Oaxaca', 'Puebla', 'Queretaro', 'Quintana Roo', 'San Luis Potosi', 
              'Sinaloa', 'Sonora', 'Tabasco', 'Tamaulipas', 'Taxcala', 'Veracruz', 'Yucatan', 'Zacatecas']
  end

  def mexico_states1
    mexico_states = mexico_states().unshift('Seleccionar')
  end
end
