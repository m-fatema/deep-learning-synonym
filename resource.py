from flask import Flask
from flask_restplus import Api, Resource, reqparse
from recursive_LSBert2 import Synonym

def get_app_details():
    app_detail = Flask(__name__)
    app_detail.namespaces = []
    api_ = Api(app_detail, title='Neural Parphrasing')
    return app_detail, api_


app, api = get_app_details()
syn = Synonym()


class BaseResource(Resource):
    parser = reqparse.RequestParser()
    parser.add_argument('input_sentence', type=str, required=True)
    parser.add_argument('mask_index', required=True)


@api.route('/a_synonym')
class SynonymResource(BaseResource):

    @api.doc(params={'input_sentence': 'sentence to paraphrase'})
    def post(self):
        """
            Get all the chunks
        """

        content = self.parser.parse_args()['input_sentence']
        mask_index = self.parser.parse_args()['mask_index']

        return syn.simplified_sentence(mask_index, content, syn.model, syn.tokenizer, syn.ranker)