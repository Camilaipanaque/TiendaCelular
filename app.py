
from flask import Flask, request, jsonify
from flask_cors import CORS
import mysql.connector
from mysql.connector import Error

app = Flask(__name__)
CORS(app)

# Conexion con XAMPP / MySQL
def conectar():
    return mysql.connector.connect(
        host="localhost",
        user="root",
        password="",  # Cambiar si MySQL tiene clave
        database="TiendaCelular",
        port=3306
    )

CAMPOS = ("marca", "modelo", "precio", "nombre", "ram")

# LISTAR TODOS LOS CELULARES
@app.route("/celulares", methods=["GET"])
def listar():
    conexion = None
    cursor = None
    try:
        conexion = conectar()
        cursor = conexion.cursor(dictionary=True)
        cursor.execute("SELECT * FROM celulares ORDER BY id")
        datos = cursor.fetchall()
        return jsonify(datos), 200
    except Error as e:
        return jsonify({"error": str(e)}), 500
    finally:
        if cursor:
            cursor.close()
        if conexion:
            conexion.close()

# AGREGAR UN CELULAR
@app.route("/celulares", methods=["POST"])
def agregar():
    datos = request.get_json(silent=True)
    if not isinstance(datos, dict):
        return jsonify({"error": "Enviar JSON valido"}), 400

    if any(c not in datos or datos[c] is None
           or datos[c] == "" for c in CAMPOS):
        return jsonify({"error": "Faltan campos"}), 400

    try:
        precio = float(datos["precio"])
        if precio < 0:
            raise ValueError()
    except (ValueError, TypeError):
        return jsonify({"error": "Precio invalido"}), 400

    conexion = None
    cursor = None
    try:
        conexion = conectar()
        cursor = conexion.cursor()
        sql = """INSERT INTO celulares
                 (marca, modelo, precio, nombre, ram)
                 VALUES (%s, %s, %s, %s, %s)"""
        valores = (
            datos["marca"], datos["modelo"],
            precio, datos["nombre"], datos["ram"]
        )
        cursor.execute(sql, valores)
        conexion.commit()
        return jsonify({
            "mensaje": "Celular agregado",
            "id": cursor.lastrowid
        }), 201
    except Error as e:
        return jsonify({"error": str(e)}), 500
    finally:
        if cursor:
            cursor.close()
        if conexion:
            conexion.close()

# ACTUALIZAR UN CELULAR
@app.route("/celulares/<int:id>", methods=["PUT"])
def actualizar(id):
    datos = request.get_json(silent=True)
    if not isinstance(datos, dict):
        return jsonify({"error": "Enviar JSON valido"}), 400

    if any(c not in datos or datos[c] is None
           or datos[c] == "" for c in CAMPOS):
        return jsonify({"error": "Faltan campos"}), 400

    try:
        precio = float(datos["precio"])
        if precio < 0:
            raise ValueError()
    except (ValueError, TypeError):
        return jsonify({"error": "Precio invalido"}), 400

    conexion = None
    cursor = None
    try:
        conexion = conectar()
        cursor = conexion.cursor()
        cursor.execute(
            "SELECT id FROM celulares WHERE id=%s", (id,)
        )
        if not cursor.fetchone():
            return jsonify({"error": "No existe"}), 404

        sql = """UPDATE celulares SET
                 marca=%s, modelo=%s, precio=%s,
                 nombre=%s, ram=%s WHERE id=%s"""
        valores = (
            datos["marca"], datos["modelo"],
            precio, datos["nombre"], datos["ram"], id
        )
        cursor.execute(sql, valores)
        conexion.commit()
        return jsonify({"mensaje": "Celular actualizado"}), 200
    except Error as e:
        return jsonify({"error": str(e)}), 500
    finally:
        if cursor:
            cursor.close()
        if conexion:
            conexion.close()

# ELIMINAR UN CELULAR
@app.route("/celulares/<int:id>", methods=["DELETE"])
def eliminar(id):
    conexion = None
    cursor = None
    try:
        conexion = conectar()
        cursor = conexion.cursor()
        cursor.execute(
            "DELETE FROM celulares WHERE id=%s", (id,)
        )
        conexion.commit()

        if cursor.rowcount == 0:
            return jsonify({"error": "No existe"}), 404

        return jsonify({"mensaje": "Celular eliminado"}), 200
    except Error as e:
        return jsonify({"error": str(e)}), 500
    finally:
        if cursor:
            cursor.close()
        if conexion:
            conexion.close()

if __name__ == "__main__":
    app.run(debug=True, port=5000)
