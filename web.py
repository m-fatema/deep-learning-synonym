from flask_cors import CORS
from resource import get_app_details,SynonymResource


def create_app():
    app, api = get_app_details()
    cors_settings(app, api)
    api.add_resource(SynonymResource, '/a_synonym', endpoint='a_synonym')
    return app

def cors_settings(app, api):
    CORS(app)
    # cors = CORS(app, resources={r"/api/*": {"origins": "*"}})


def main():
    app = create_app()
    # app.run(host='127.0.0.1', port='2020', debug=True)
    app.run(host='0.0.0.0', port='2050', debug=True)


if __name__ == '__main__':
    main()