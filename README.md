# cicd-pipeline-python-cd

Calculadora web (Flask) con un pipeline de CI/CD en GitHub Actions: integración continua
(Black, Pylint, Flake8, pytest, Selenium, SonarCloud y publicación en Docker Hub) y
despliegue con Terraform en AWS ECS (Fargate), primero en Staging y luego en Producción.

## Integrantes

Jose Miguel Blanco

| Integrante | Usuario de GitHub | Rol |
|---|---|---|
| Jose Miguel Blanco | [@Josem0117](https://github.com/Josem0117) | Propietario del repositorio |

## Ejecución local

```bash
python -m venv venv && source venv/bin/activate   # Windows: venv\Scripts\activate
pip install -r requirements-dev.txt
python -m app.app                                  # http://localhost:5000
pytest --ignore=tests/test_acceptance_app.py --ignore=tests/test_smoke_app.py --cov-fail-under=80
```
