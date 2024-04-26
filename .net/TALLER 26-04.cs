using System;
using System.Collections.Generic;

//Juan Pablo Cañas

class Program
{
    static List<string> documentos = new List<string>();
    static List<string> nombres = new List<string>();
    static List<int> inasistencias = new List<int>();

    static void Main(string[] args)
    {
        int opcion;
        do
        {
            Console.WriteLine("Menú:");
            Console.WriteLine("1 Registrar inasistencias");
            Console.WriteLine("2 Listar todas las inasistencias");
            Console.WriteLine("3 Listar los aprendices con inasistencias superiores a 3");
            Console.WriteLine("4 Consultar el total de inasistencias por aprendiz");
            Console.WriteLine("5 Valor a pagar");
            Console.WriteLine("6 Número de suerte");
            Console.WriteLine("7 Salir");
            Console.Write("Seleccione una opción: ");
            opcion = Convert.ToInt32(Console.ReadLine());

            switch (opcion)
            {
                case 1:
                    RegistrarInasistencias();
                    break;
                case 2:
                    ListarTodasInasistencias();
                    break;
                case 3:
                    ListarInasistenciasSuperioresA3();
                    break;
                default:
                    Console.WriteLine("Seleccione una opcion valida");
                    break;
            }
        } while (opcion != 7);
    }

    static void RegistrarInasistencias()
    {
        Console.Write("Ingrese el documento del aprendiz: ");
        string documento = Console.ReadLine();
        int index = documentos.IndexOf(documento);

        if (index != -1)
        {
            Console.Write("Ingrese la cantidad de inasistencias (entre 1 y 100): ");
            int inasistencia = Convert.ToInt32(Console.ReadLine());
            while (inasistencia < 1 || inasistencia > 100)
            {
                Console.Write("Cantidad inválida. Ingrese la cantidad de inasistencias (entre 1 y 100): ");
                inasistencia = Convert.ToInt32(Console.ReadLine());
            }
            inasistencias[index] += inasistencia;
        }
        else
        {
            Console.Write("Ingrese el nombre completo del aprendiz: ");
            string nombre = Console.ReadLine();
            Console.Write("Ingrese la cantidad de inasistencias (entre 1 y 100): ");
            int inasistencia = Convert.ToInt32(Console.ReadLine());
            while (inasistencia < 1 || inasistencia > 100)
            {
                Console.Write("Cantidad inválida. Ingrese la cantidad de inasistencias (entre 1 y 100): ");
                inasistencia = Convert.ToInt32(Console.ReadLine());
            }

            documentos.Add(documento);
            nombres.Add(nombre);
            inasistencias.Add(inasistencia);
        }

        Console.WriteLine("Inasistencias registradas correctamente.");
    }

    static void ListarTodasInasistencias()
    {
        if (documentos.Count == 0)
        {
            Console.WriteLine("No hay inasistencias registradas.");
            return;
        }

        Console.WriteLine("Inasistencias registradas:");
        for (int i = 0; i < documentos.Count; i++)
        {
            Console.WriteLine($"Documento: {documentos[i]}, Nombre: {nombres[i]}, Inasistencias: {inasistencias[i]}");
        }
    }

    static void ListarInasistenciasSuperioresA3()
    {
        Console.WriteLine("Aprendices con inasistencias superiores a 3:");
        for (int i = 0; i < documentos.Count; i++)
        {
            if (inasistencias[i] > 3)
            {
                Console.WriteLine($"Documento: {documentos[i]}, Nombre: {nombres[i]}, Inasistencias: {inasistencias[i]}");
            }
        }
    }

}
