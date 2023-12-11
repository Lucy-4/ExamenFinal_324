using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace WindowsFormsApplication34
{
    public partial class Form2 : Form
    {
        public Form2()
        {
            InitializeComponent();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void Form2_Load(object sender, EventArgs e)
        {
            ServiceReference1.WebService1SoapClient ws = new ServiceReference1.WebService1SoapClient();
            dataGridView1.DataSource = ws.obtalumno().Tables[0];
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                // Obtener el identificador desde la caja de texto
                string ciToDelete = textBox1.Text;

               
                // Crear instancia del cliente del servicio web
                var cliente = new ServiceReference1.WebService1SoapClient();

                // Llamar al método del servicio web para eliminar el registro
                cliente.eliminarAlumno(ciToDelete);

                // Actualizar el DataGridView después de eliminar
                RefreshDataGridView();

                // Limpiar la caja de texto
                textBox1.Clear();
            }
            catch (Exception ex)
            {
                // Manejar excepciones adecuadamente (mostrar un mensaje de error, registrar, etc.)
                MessageBox.Show($"Error: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

        }


        private void RefreshDataGridView()
        {
            try
            {
                // Llamada al método GetAlumnos para obtener los datos actualizados
                var cliente = new ServiceReference1.WebService1SoapClient();
                DataSet dataSet = cliente.obtalumno();

                // Verificar si el DataSet tiene alguna tabla y filas
                if (dataSet != null && dataSet.Tables.Count > 0 && dataSet.Tables[0].Rows.Count > 0)
                {
                    // Asignar el DataSet al DataSource del DataGridView
                    dataGridView1.DataSource = dataSet.Tables[0];
                }
                else
                {
                    dataGridView1.DataSource = null;
                    MessageBox.Show("No hay datos disponibles.", "Información", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
            }
            catch (Exception ex)
            {
                // Manejar excepciones adecuadamente (mostrar un mensaje de error, registrar, etc.)
                MessageBox.Show($"Error: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            try
            {
                // Obtener los valores de las cajas de texto
                string ci = textBox2.Text;
                string nombre = textBox3.Text;

               // Crear instancia del cliente del servicio web
                var cliente = new ServiceReference1.WebService1SoapClient();

                // Llamar al método del servicio web para insertar un nuevo registro
                cliente.agregarAlumno(ci, nombre);

                // Actualizar el DataGridView después de la inserción
                RefreshDataGridView();

                // Limpiar las cajas de texto después de la inserción
                textBox2.Clear();
                textBox3.Clear();
            }
            catch (Exception ex)
            {
                // Manejar excepciones adecuadamente (mostrar un mensaje de error, registrar, etc.)
                MessageBox.Show($"Error: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            try
            {
                // Obtener los valores de las cajas de texto
                string ci = textBox4.Text;
                string nuevoNombre = textBox5.Text;

               
                // Crear instancia del cliente del servicio web
                var cliente = new ServiceReference1.WebService1SoapClient();

                // Llamar al método del servicio web para actualizar un registro
                cliente.editarAlumno(ci, nuevoNombre);

                // Actualizar el DataGridView después de la actualización
                RefreshDataGridView();

                // Limpiar las cajas de texto después de la actualización
                textBox4.Clear();
                textBox5.Clear();
            }
            catch (Exception ex)
            {
                // Manejar excepciones adecuadamente (mostrar un mensaje de error, registrar, etc.)
                MessageBox.Show($"Error: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void label7_Click(object sender, EventArgs e)
        {

        }
    }
}
