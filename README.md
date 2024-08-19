# README

## Local Development

Install dependencies

```
bundle install
```

Start the server by executing the following command.

```
bundle exec rails server -p 3000
```

## API Documentation

### Calculations

| Endpoint          | Method | Description        |
| ----------------- | ------ | ------------------ |
| /api/calculations | POST   | Calculates the sum |

**Request:**

```json
{
  "calculation": {
    "input": "//[***][%]\n1***2***4%1"
  }
}
```

**Response:**

```json
{
  "sum": 8
}
```
