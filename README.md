# Todos x Tom

Las rifas se llevarán a cabo de la siguiente forma:

## Colaboración

Para colaborar con 1 (una) rifa hay que hacer una transferencia a la dirección [ADDRESS] con uno de los siguientes:

| Red      | Token | Cantidad |
| -------- | ----- | -------- |
| Polygon  | MATIC | 10       |
| Polygon  | USDT  | 5        |
| Polygon  | USDC  | 5        |
| Polygon  | DAI   | 5        |
| Ethereum | ETH   | 0.003    |
| Ethereum | USDT  | 5        |
| Ethereum | USDC  | 5        |
| Ethereum | DAI   | 5        |

Para colaborar con más rifas hay que transferir la cantidad del token deseado de 1 (una) rifa multiplicada por la cantidad de rifas. Por ejemplo, 30 MATIC, 15 USDC o 0.009 ETH equivalen a 3 rifas.

## Distribución de rifas

Se recopilarán todas las colaboraciones (recibidas en la dirección) en un archivo .csv con las siguientes columnas:

-   timestamp (fecha y hora)
-   dirección del colaborador/a
-   red
-   token
-   cantidad del token
-   cantidad de rifas

Luego se hará una lista de las rifas, ocupando en el mismo orden la cantidad de rifas que corresponda.

Ejemplo:

| Timestamp | Dirección | Red | Token | Cantidad | Rifas |
| --------- | --------- | --- | ----- | -------- | ----- |
| ...       | A         | ... | ...   | ...      | 3     |
| ...       | B         | ... | ...   | ...      | 1     |
| ...       | C         | ... | ...   | ...      | 2     |

| Número de rifa | Dirección |
| -------------- | --------- |
| 1              | A         |
| 2              | A         |
| 3              | A         |
| 4              | B         |
| 5              | C         |
| 6              | C         |

Ambos archivos serán publicados en IPFS e incluido el hash en el smart contract del sorteo.

## Sorteo

El smart contract brindará para cada número de premio, un número de rifa ganador y por lo tanto, una dirección ganadora. Se podrá consultar y auditar tanto el código del smart contract como los ganadores una vez ejecutado.
