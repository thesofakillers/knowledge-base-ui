# frozen_string_literal: true
class BidirectionalLinksGenerator < Jekyll::Generator
  def generate(site)
    graph_nodes = []
    graph_edges = []

    all_notes = site.collections['notes'].docs

    # Identify note backlinks and add them to each note
    all_notes.each do |current_note|
			# Nodes: Jekyll
      notes_linking_to_current_note = all_notes.filter do |e|
        e.content.include?(note_id_from_note(current_note))
      end

      # Nodes for D3JS Graph
      graph_nodes << {
        id: note_id_from_note(current_note),
        path: current_note.url,
        label: current_note.data['title'],
      } unless current_note.path.include?('_notes/index.html')

			# Edges for Jekyll
      current_note.data['backlinks'] = notes_linking_to_current_note

      # Edges for D3JS graph
      notes_linking_to_current_note.each do |n|
        graph_edges << {
          source: note_id_from_note(n),
          target: note_id_from_note(current_note),
        }
      end
    end

    # Will be processed by  D3JS in notes_graph.html
    File.write('_includes/notes_graph.json', JSON.dump({
      edges: graph_edges,
      nodes: graph_nodes,
    }))
  end

  def note_id_from_note(note)
    note.data['id']
  end
end
